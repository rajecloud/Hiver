

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = "Rules for inbound and outbound traffic"
  vpc_id      = var.vpc_id
  tags        = var.tags
}

resource "aws_security_group_rule" "sg_rule1" {
  type              = var.sg_type
  from_port         = var.sg_http_port
  to_port           = var.sg_http_port
  protocol          = var.sg_protocol
  cidr_blocks       = ["${var.cidr_blocks}"]
  security_group_id = aws_security_group.security_group.id
  depends_on        = [aws_security_group.security_group]
}

resource "aws_security_group_rule" "sg_rule2" {
  type              = var.sg_type
  from_port         = var.sg_https_port
  to_port           = var.sg_https_port
  protocol          = var.sg_protocol
  cidr_blocks       = ["${var.cidr_blocks}"]
  security_group_id = aws_security_group.security_group.id
  depends_on        = [aws_security_group.security_group]
}