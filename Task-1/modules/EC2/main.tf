

resource "aws_instance" "instance" {
    ami                     = var.ami
    instance_type           = var.instance_type
    availability_zone       = var.availability_zone
    subnet_id               = var.subnet_id
    disable_api_termination = var.ec2_termination_protection
    key_name                = var.key_pair
    private_ip              = var.private_ip
    security_groups         = var.security_groups
    source_dest_check       = var.source_dest_check
    monitoring              = var.monitoring
    tags                    = var.tags

    dynamic "root_block_device" {
        for_each = var.root_block_device
        content {
        delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
        iops                  = lookup(root_block_device.value, "iops", null)
        volume_size           = lookup(root_block_device.value, "volume_size", null)
        volume_type           = lookup(root_block_device.value, "volume_type", null)
        throughput            = lookup(root_block_device.value, "throughput", null)
        }
    }
}