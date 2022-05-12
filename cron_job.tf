resource "kubernetes_cron_job" "restart" {
  metadata {
    name      = local.instance_name
    namespace = var.namespace

    labels = {
      "app.kubernetes.io/component" = "restart-service"
      "app.kubernetes.io/instance"  = var.instance
    }
  }

  spec {
    concurrency_policy = "Forbid"
    schedule           = var.schedule

    job_template {
      metadata {}
      spec {
        backoff_limit = 2

        active_deadline_seconds = 600

        template {
          metadata {}
          spec {
            service_account_name = kubernetes_service_account.restart.metadata.0.name

            restart_policy = "Never"

            container {
              name  = "kubectl"
              image = "bitnami/kubectl"

              command = [
                "kubectl",
                "rollout",
                "restart",
                "${var.resource_type}/${var.resource_name}"
              ]
            }
          }
        }
      }
    }
  }
}
