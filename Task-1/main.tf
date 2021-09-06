
## Provisoning the EC2 Instances on default VPC Private subnet and attaching Network Load Balancer
## as a Frontend Endpoint 

provider "aws" {
    profile = "default"
    region = var.region
}

data "aws_vpc" "default" {
    default = true
}

locals {
    name = var.instance_name
    tags = {
            Project     = "Hiver"
            Environment = "TEST"
            Owner       = "Esakkiraj"
        }
}

module "private_subnet" {
    source                      = "./modules/Private_Subnet"
    availability_zone           = var.availability_zone
    map_public_ip_on_launch     = true
    subnet_ip                   = var.subnet_cidr
    vpc_id                      = data.aws_vpc.default.id
    tags                        = merge({ "Name" = var.subnet_name }, local.tags)
}

module "sg" {
    source                      = "./modules/Security_Group"
    security_group_name         = var.sg_name
    vpc_id                      = data.aws_vpc.default.id
    cidr_blocks                 = "0.0.0.0/0"
    sg_http_port                = 80
    sg_https_port               = 443
    sg_type                     = "ingress"
    sg_protocol                 = "tcp"
    tags                        = local.tags
}

module "instance" {
    source                      = "./modules/EC2"
    count                       = var.instance_count
    instance_name               = local.name
    ami                         = var.image
    instance_type               = var.instance_type
    availability_zone           = var.availability_zone
    subnet_id                   = module.private_subnet.private_subnet_id
    ec2_termination_protection  = false
    key_pair                    = var.key_pair
    security_groups             = "${module.sg.sg_id}"
    monitoring                  = false
    tags                        = merge({ "Name" = "${var.instance_name}-${count.index + 1}" }, local.tags)
    depends_on                  = [module.private_subnet, module.sg]
}

module "nlb" {
    source                      = "./modules/NLB"
    instance_count              = var.instance_count
    name                        = "${var.instance_name}-nlb"
    internal_lb                 = false
    load_balancer_type          = "network"
    subnet_id                   = "${module.private_subnet.private_subnet_id}"
    tg_name                     = "${var.instance_name}-nlb-tg"
    port                        = 80
    protocol                    = "TCP"
    vpc_id                      = data.aws_vpc.default.id
    target_type                 = "instance"
    health_check_enabled        = true
    health_check_port           = 80
    health_check_path           = "/"
    instance_id                 = module.instance.*.instance_id
    tags                        = local.tags
    depends_on                  = [module.instance]
}