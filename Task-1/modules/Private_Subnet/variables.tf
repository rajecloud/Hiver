# variable "region" {
#     description = "AWS Region where all the resources will be created and resided."
#     default = "ap-south-1"
# }


variable "availability_zone" {
    description = "Name of the Availability Zone for Subnet to be created"
    default = "ap-south-1a"
}

variable "map_public_ip_on_launch" {
    description = "Make it False, if Public IP's are not assigned automatically for newly creating AWS services. i.e EC2"
    default = true
    type = bool
}

variable "tags" {
    description = "A map of Tags assign to the AWS resources"
    default = {}
    type = map
}

variable "vpc_id" {
  description = "The VPC ID to launch in"
  default     = ""
}

variable "subnet_ip" {
    description = "CIDR ip ranges block or ip to be allowed for access"
    default = ""
}
