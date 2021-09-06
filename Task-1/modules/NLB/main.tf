

resource "aws_lb" "nlb" {
  name               = var.name
  internal           = var.internal_lb
  load_balancer_type = var.load_balancer_type
  subnets            = ["${var.subnet_id}"]
  enable_deletion_protection = var.enable_deletion_protection
  access_logs {
      enabled = var.access_logs
      bucket  = var.bucket_name
  }
  tags = var.tags
}

resource "aws_lb_target_group" "nlb_tg" {
  name        = var.tg_name
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type
  health_check {
      enabled             = var.health_check_enabled
      healthy_threshold   = var.healthy_threshold
      interval            = var.interval
      port                = var.health_check_port
      protocol            = var.health_check_protocol
      path                = var.health_check_path
      unhealthy_threshold = var.unhealthy_threshold
  }
}

resource "aws_lb_target_group_attachment" "nlb_tg_attached" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = "${element(split(",", join(",", var.instance_id)), count.index)}"
  port             = var.port
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = var.port
  protocol          = var.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

