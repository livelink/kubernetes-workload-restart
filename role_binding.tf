resource "kubernetes_role_binding" "restart" {
  metadata {
    name      = local.instance_name
    namespace = var.namespace

    labels = {
      "app.kubernetes.io/component" = "restart-service"
      "app.kubernetes.io/instance"  = var.instance
    }
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.restart.metadata.0.name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.restart.metadata.0.name
    namespace = var.namespace
  }
}
