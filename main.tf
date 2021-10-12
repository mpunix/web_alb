# Moorthi Pongiannnan
# Web http ALB 8080 --> 443

provider "aws" {
    region = var.aws_region
    access_key = "xxxx"
    secret_key = "xxxx"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "my-alb"
  load_balancer_type = "application"
  vpc_id             = var.vpc_id_number
  subnets            = var.vpc_subnets
  security_groups    = var.vpc_security_groups

  target_groups = [
    {
      name_prefix      = "webtg"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = var.ec2_instances_ids[0]
          port = 80
        },
        {
          target_id = var.ec2_instances_ids[1]
          port = 80
        }
      ]
    }
  ]

 https_listeners = [
    { 
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 8080
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Production"
  }
}
