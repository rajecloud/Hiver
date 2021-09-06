
# variable "region" {
#     description = "AWS Region where all the resources will be created and resided."
#     default = "ap-south-1"
# }

variable "name" {
  description = "Name to be used on NLB created"
  default     = ""
}

variable "internal_lb" {
  description = "Make it True for Private Load balancer"
  default     = false
  type = bool
}

variable "load_balancer_type" {
  description = "Type of Load Balancer. i.e application or network"
  default     = "network"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = null
}

variable "instance_count" {
  description = "Instance Count"
  default     = 1
}

variable "enable_deletion_protection" {
  description = "Make it True for deletion protection"
  default     = false
  type = bool
}

variable "access_logs" {
  description = "Make it True for enable access_logs and add the s3 bucket to store"
  default     = false
  type = bool
}


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "tg_name" {
  description = "Name to be used on Target Group created"
  default     = ""
}

variable "bucket_name" {
  description = "Bucket name to store nlb access logs"
  default     = "demo"
}

variable "port" {
  description = "Port number to be used"
  default     = 80
}

variable "protocol" {
  description = "Protocol to be used"
  default     = "http"
}

variable "vpc_id" {
  description = "The VPC ID to launch in"
  default     = ""
}

variable "target_type" {
  description = "Target type. i.e instance, ip's, lambda"
  default     = "instance"
}

variable "health_check_enabled" {
  description = "Make it False to stop health checks"
  default     = true
  type = bool
}

variable "health_check_protocol" {
  description = "Protocol for health check to be used"
  default     = "HTTP"
}

variable "healthy_threshold" {
  description = "Healthy Thresholds to be used for health checks"
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Unhealthy Thresholds to be used for health checks"
  default     = 3
}

variable "health_check_port" {
  description = "Port number for health check"
  default     = 80
}

variable "health_check_path" {
  description = "Target group Path for health check use"
  default     = "HTTP"
}

variable "interval" {
  description = "Intervals to be used for health checks"
  default     = 30 
}

variable "instance_id" {
  description = "Id of the instances to be attached to the TG"
  default     = ""
}