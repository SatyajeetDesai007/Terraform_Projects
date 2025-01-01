# vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs            = data.aws_availability_zones.azs.names

  public_subnets = var.public_subnet
  private_subnets  = var.private_subnet

  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
  "kubernates.io/cluster/my-eks-cluster" = "shared"
  }

  public_subnet_tags = {
   "kubernates.io/cluster/my-eks-cluster" = "shared"
   "kubernates.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernates.io/cluster/my-eks-cluster" = "shared"
   "kubernates.io/role/internal-elb"=1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true


  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.privete_subnets

  eks_managed_node_group_defaults = {
    node = {
        min_size = 1
        max_size = 3
        dezired_size = 2

        instance_type = ["t2.small"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
