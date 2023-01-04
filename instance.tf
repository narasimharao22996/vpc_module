resource "aws_key_pair" "key" {
  key_name   = "key_1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlYfNJlNbujyMblRhg0Zwl9ZjcnUu1ZvkDkXBDVBXTsc14sPTqxutYxUKdv+euqxJd43KfMDcXrzVj8FN6UJb6ye+FNd/sh4n7eAUwtkYG6zptDWlGv/H6TKnTuiTjHfdYn4nwy49t5vTsmHTgevoAl37mr3yIOEwejTyqHxXKTLy9tYOeHaNzZNkcsiGDB94ELAEn8pBfa4a73TBmK+YqRuPVf+A8kyZfGIu62zSMgjSVgErrmV1oqpKI0oU5c0HWnN99YgxAetQYG/FXuJwOU/X0kWeaF7Aw+j46px+pm3ZoXwYzuBCezdoPpa30mmIaLruHvkrfK6SiT/gmAKi+wbXAQhEbHV5ipjcLkxbfV59YGveMcPnvooZFEaNFBQUj5knGVwORtRgPc5ZMAUUdLhv09tJ7V7XIMGU0fz1/1T3uW2uug4ReSk4kP84mI7+pxAsVwZeTUZb4ob9o8SAOTc1T7kpNGGDYv8R/uhXtLwSSs5SSq537HRqiQMbapVc= admin@DESKTOP-TC12A8K"
  }

resource "aws_instance" "webec2" {
    ami = var.ami-id
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [ aws_security_group.web_sg.id]
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "Name" = "web"
    }

    depends_on = [
      module.vpc,
      aws_security_group.web_sg
    ]
  
}


