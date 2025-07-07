resource "aws_instance" "this" {
  ami           = "ami-020cba7c55df1f615"  # Replace with appropriate AMI
  instance_type = "t2.medium"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data     = var.user_data
  tags = {
    Name = var.name
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = var.tg_arn
  target_id        = aws_instance.this.id
  port             = 8000
}

output "ec2_instance_tags" {
  value = aws_instance.this.tags_all
}