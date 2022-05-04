resource "kubernetes_role" "restart" {
  metadata {
    name      = local.instance_name
    namespace = var.namespace

    labels = {
      "app.kubernetes.io/component" = "restart-service"
      "app.kubernetes.io/instance"  = var.instance
    }
  }

  rule {
    api_groups     = ["apps", "extensions"]
    resources      = [var.resource_type]
    resource_names = [var.resource_name]
    verbs          = ["get", "patch", "list", "watch"]
  }

}
