#      _____    _  __  ______ 
#     |  __ \  | |/ / |  ____|
#     | |__) | | ' /  | |__   
#     |  _  /  |  <   |  __|  
#     | | \ \  | . \  | |____ 
#     |_|  \_\ |_|\_\ |______|

module "rke-vpc" {

  # source = "./../../../terraform-aws-vpc"
  source  = "jason-morsley/vpc/aws"

  name = "rke-example"

  vpc_cidr = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)

  public_subnet_cidrs = ["10.0.1.0/24"] # 251 (256 possible - 5 reserved by AWS)
  private_subnet_cidrs = ["10.0.2.0/24"] # 251 (256 possible - 5 reserved by AWS)
  
  public_subnet_tags = local.cluster_id_tag

  availability_zones = data.aws_availability_zones.available.names
  
}

# The creation of our VPC, first you pass the Module the location of the source code for the child Module.
# The name of the VPC created in variables.tf "simple-example"
# The CIDR block information for both the private and public subnets.
# Then sets the public subnet tag to the cluster id tag
# Lastly the list of AZs we got from availability_zones.tf