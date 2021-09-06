
variable "region" {
    description = "AWS Region where all the resources will be created and resided."
    default = "ap-south-1"
}


variable "enable_dns_support" {
    description = "Make it False, if dns support are not required for newly creating AWS services. i.e EC2"
    default = true
    type = bool
}

variable "enable_dns_hostnames" {
    description = "Make it False, if hostnames are not required for newly creating AWS services. i.e EC2"
    default = true
    type = bool
}

variable "tags" {
    description = "A map of Tags assign to the AWS resources"
    default = {}
    type = map
}
