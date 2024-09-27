provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-0c55b159cbfafe1f0" # Example Ubuntu AMI
  instance_type = "t2.micro"
  key_name = "my-key"

  tags = {
    Name = "WebServer${count.index + 1}"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
            EOF
}

resource "aws_elb" "web_elb" {
  name = "web-elb"
  availability_zones = ["us-west-2a"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.web[*].id
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql8.0"
}
