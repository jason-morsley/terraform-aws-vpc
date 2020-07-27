#     _____                      _           
#    / ____|                    | |          
#   | |     ___  _ __ ___  _ __ | | _____  __
#   | |    / _ \| '_ ` _ \| '_ \| |/ _ \ \/ /
#   | |___| (_) | | | | | | |_) | |  __/>  < 
#    \_____\___/|_| |_| |_| .__/|_|\___/_/\_\
#                         | |                
#                         |_|        

module "complex-vpc" {

  source = "./../../../terraform-aws-vpc"

  name = var.name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  
  availability_zones = data.aws_availability_zones.available.names
  
}

# The creation of our VPC, first you pass the Module the location of the source code for the child Module.
# The name of the VPC created in variables.tf "simple-example"
# The CIDR block information for both the private and public subnets, also created in variables.tf 
# Then the CIDR block for the public subnet 
# Lastly the list of AZs we got from availability_zones.tf