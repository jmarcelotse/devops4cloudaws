provider "aws" {
  region = "us-east-2"
}

# CloudFormation Stack para criar a VPC EKS
resource "aws_cloudformation_stack" "eks_vpc" {
  name         = "eks-stack-nxt"
  template_url = "https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml"
}

# Captura os SubnetIds do output da stack e converte para uma lista
locals {
  subnet_ids = split(",", aws_cloudformation_stack.eks_vpc.outputs["SubnetIds"])
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = "eks-cluster-nxt"
  role_arn     = module.iam.cluster_role_arn
  subnet_ids   = local.subnet_ids
}

module "eks_node_group" {
  source           = "./modules/eks_node_group"
  cluster_name     = module.eks.cluster_name
  node_group_name  = "default"
  node_role_arn    = module.iam.worker_role_arn
  subnet_ids       = local.subnet_ids
  ami_type         = "AL2_x86_64"
  instance_type    = "t3.medium"
  desired_capacity = 2
  min_size         = 2
  max_size         = 4
}
