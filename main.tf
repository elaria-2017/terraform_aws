module "network" {
    source = "./network"
    vpc_cidr = var.vpc_cidr
    name = var.name
    public_subnet1_cidr = var.public_subnet1_cidr
    public_subnet2_cidr = var.public_subnet2_cidr
    private_subnet1_cidr = var.private_subnet1_cidr
    private_subnet2_cidr = var.private_subnet2_cidr
    AZ1 = var.AZ1
    AZ2 = var.AZ2
}