resource "kubernetes_service_account_v1" "restart" {
  metadata {
    name      = local.instance_name
    namespace = var.namespace

    labels = {
      "app.kubernetes.io/component" = "restart-service"
      "app.kubernetes.io/instance"  = var.instance
    }
  }
}
