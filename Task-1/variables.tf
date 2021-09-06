variable "region" {
    description = "AWS Region where all the resources will be created and resided."
    default = "ap-south-1"
}

variable "instance_count" {
  description = "No of EC2 instances to be created"
  default     = 1
}

variable "instance_name" {
  description = "Name to be used on EC2 instance created"
  default     = ""
}

variable "instance_type" {
  description = "Name to be used on EC2 instance created"
  default     = ""
}

variable "image" {
  description = "ID of AMI to use for the instance"
  default     = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  default     = "ap-south-1a"
}

variable "key_pair" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  default     = null
}

variable "sg_name" {
    description = "Name of the security group to be created"
    default = ""
}

variable "subnet_name" {
    description = "Name of the private Subnet to be created"
    default = ""
}

variable "subnet_cidr" {
    description = "CIDR IP for the private Subnet to be created"
    default = ""
}

