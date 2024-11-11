variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "node_group_name" {
  description = "Nome do grupo de nós EKS"
  type        = string
}

variable "node_role_arn" {
  description = "ARN da Role do grupo de nós EKS"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets para o Node Group"
  type        = list(string)
}

variable "ami_type" {
  description = "Tipo de AMI para os nodes do EKS"
  type        = string
  default     = "AL2_x86_64"
}

variable "instance_type" {
  description = "Tipo de instância para o Node Group"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Capacidade desejada para o Node Group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Capacidade mínima para o Node Group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Capacidade máxima para o Node Group"
  type        = number
  default     = 4
}
