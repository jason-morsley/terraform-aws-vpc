#      ______   _____   _____  
#     |  ____| |_   _| |  __ \ 
#     | |__      | |   | |__) |
#     |  __|     | |   |  ___/ 
#     | |____   _| |_  | |     
#     |______| |_____| |_|     

# https://www.terraform.io/docs/providers/aws/r/eip.html

resource "aws_eip" "nat-gateway" {
  vpc = true
}

# A single EIP associated with an instance