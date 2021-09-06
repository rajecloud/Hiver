# variable "region" {
#     description = "AWS Region where all the resources will be created and resided."
#     default = "ap-south-1"
# }


variable "security_group_name" {
    description = "Name of the security group to be created"
    default = ""
}

variable "vpc_id" {
    description = "Id of the created or existing VPC for SG to be created"
    default = ""
}

variable "tags" {
    description = "A map of Tags assign to the AWS resources"
    default = {}
    type = map
}

variable "cidr_blocks" {
    description = "CIDR ip ranges block or ip to be allowed for access"
    default = []
}

variable "sg_type" {
    description = "Type of the security group rule to be attached. i.e ingress or egress "
    default = "ingress"
}

variable "sg_protocol" {
    description = "TSecurity group rule protocol i.e tcp "
    default = "ingress"
}

variable "sg_http_port" {
    description = "Start port for HTTP (or ICMP type number if protocol is icmp)."
    default = 80
}

variable "sg_https_port" {
    description = "Start port for HTTPS (or ICMP type number if protocol is icmp)."
    default = 443
}