resource "aws_instance" "testinstance" {

ami = var.ami

instance_type = "t2.micro"

subnet_id = module.network.pri_sub1_id

associate_public_ip_address = false

vpc_security_group_ids = [ aws_security_group.private.id ]

key_name = "public"

tags =  {

Name = "testinstance"

}

}