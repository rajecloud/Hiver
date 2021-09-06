# variable "region" {
#     description = "AWS Region where all the resources will be created and resided."
#     default = "ap-south-1"
# }

variable "instance_name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = ""
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = "ap-south-1a"
}

variable "ec2_termination_protection" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = null
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}


variable "key_pair" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

