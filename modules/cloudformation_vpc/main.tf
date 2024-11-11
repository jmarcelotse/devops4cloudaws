resource "aws_cloudformation_stack" "eks_vpc" {
  name         = "eks-stack-nxt"
  template_url = "https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/amazon-eks-vpc-private-subnets.yaml"
}
