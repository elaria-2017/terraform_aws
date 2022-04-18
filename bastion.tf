resource "aws_instance" "bastioninstance" {

ami = var.ami

instance_type = "t2.micro"

subnet_id = module.network.pub_sub1_id

associate_public_ip_address = true

vpc_security_group_ids = [ aws_security_group.public.id ]

key_name = "public"

tags =  {

Name = "bastioninstance"

}
provisioner "local-exec" {
    command = "echo ${self.id}"
}

}