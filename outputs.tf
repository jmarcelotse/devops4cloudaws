output "cluster_role_arn" {
  value = module.iam.cluster_role_arn
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}
