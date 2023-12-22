resource "aws_security_group" "alb-sg" {
  name   = "ALBSecurityGroup"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    Name = "TF_ALBSecurityGroup"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "server-sg" {
  name   = "WebServerSecurityGroup"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    Name = "TF_WebServerSecurityGroup"
  }

  ingress {
    from_port       = 80
    protocol        = "tcp"
    to_port         = 80
    security_groups = [aws_security_group.alb-sg.id] # Attention
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db-sg" {
  name   = "RDSSecurityGroup"
  vpc_id = data.aws_vpc.selected.id
  tags = {
    "Name" = "TF_RDSSecurityGroup"
  }
  ingress {
    security_groups = [aws_security_group.server-sg.id] # Attention
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = -1
    to_port     = 0
  }
}


resource "aws_autoscaling_group" "app-asg" {
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  name                      = "phonebook-asg"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_alb_target_group.app-lb-tg.arn]
  vpc_zone_identifier       = aws_alb.app-lb.subnets
  launch_template {
    id      = aws_launch_template.asg-lt.id
    version = aws_launch_template.asg-lt.latest_version
  }
}