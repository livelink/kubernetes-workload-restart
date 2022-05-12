variable "resource_type" {
  description = <<EOT
Name of the K8S resource type that you want to restart
Accepts:
* deployments
* statefulsets
* daemonsets
EOT

  type = string
}

variable "resource_name" {
  description = "Name of resource to touch"
  type        = string
}
variable "namespace" {
  description = "kubernetes namespace where the resources exist"
  default     = "default"
  type        = string
}

variable "instance" {
  description = "unique instance name for this module instance to allow this to be used on multiple resources"
  type        = string
}


variable "schedule" {
  description = <<EOT
Cron job schedule for restart
Accepts standard cron format: m h domo mo dow
default: 0 * * * *
EOT
  default = "0 * * * *"
}
