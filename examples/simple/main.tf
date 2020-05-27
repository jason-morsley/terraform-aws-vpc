#       _____ _                 _      
#      / ____(_)               | |     
#     | (___  _ _ __ ___  _ __ | | ___ 
#      \___ \| | '_ ` _ \| '_ \| |/ _ \
#      ____) | | | | | | | |_) | |  __/
#     |_____/|_|_| |_| |_| .__/|_|\___|
#                        | |           
#                        |_|           

module "simple-vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "/jason-morsley/terraform-aws-vpc"

  name = var.name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs
  
  availability_zones = data.aws_availability_zones.available.names
  
}

# The creation of our VPC, first you pass the Module the location of the source code for the child Module.
# The name of the VPC created in variables.tf "simple-example"
# The CIDR block information also created in variables.tf "10.0.0.0/16"
# Then the CIDR block for the public subnet "10.0.1.0/24"
# Lastly the list of AZs we got from availability_zones.tf