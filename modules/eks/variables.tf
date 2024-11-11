variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "role_arn" {
  description = "ARN da Role do cluster EKS"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets para o cluster EKS"
  type        = list(string)
}
