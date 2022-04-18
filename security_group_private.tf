resource "aws_security_group" "private" {
  name = "security_group_private"
  vpc_id = module.network.vpc_id
  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [module.network.vpc_cidr] 
  }
    ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = [module.network.vpc_cidr] 
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags ={
     Name="security_group_private"

  }
}