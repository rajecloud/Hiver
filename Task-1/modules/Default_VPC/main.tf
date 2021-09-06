

provider "aws" {
    region = var.region
}

resource "aws_default_vpc" "vpc_default" {
    enable_dns_support      = var.enable_dns_support
    enable_dns_hostnames    = var.enable_dns_hostnames
    tags                    = var.tags
}