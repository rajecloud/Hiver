# variable "region" {
#     description = "AWS Region where all the resources will be created and resided."
#     default = "ap-south-1"
# }

variable "security_group_type" {
    description = "Type of the security group rule to be attached. i.e ingress or egress "
    default = "ingress"
}

variable "security_group_id" {
    description = "ID of the security group which creating rules to be attached."
    type        = list(string)
    default     = null
}

variable "from_port" {
    description = "Start port (or ICMP type number if protocol is icmp)."
    default = "0"
}

variable "to_port" {
    description = "End port (or ICMP type number if protocol is icmp)."
    default = "65535"
}

variable "protocol" {
    description = "Protocol to be used. i.e icmp, tcp, udp, or all the protocol number"
    default = "tcp"
}


variable "cidr_blocks" {
    description = "CIDR ip ranges block or ip to be allowed for access"
    default = "0.0.0.0/0"
}