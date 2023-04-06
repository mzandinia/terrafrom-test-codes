module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.0"

  name               = "${local.name}-alb"
  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [for subnet in module.vpc.public_subnets : subnet]
  security_groups = [module.alb_sg.security_group_id]

  # Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0 # App1 TG associated to this listener
    }
  ]

  # Target Groups
  target_groups = [
    # App1 Target Group - TG Index = 0
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      stickiness = {
        enabled = true
        type    = "lb_cookie"
      }

      protocol_version = "HTTP1"

      # App1 Target Group - Targets
      targets = {
        my_app1_vm1 = {
          target_id = local.private_ec2_id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = local.private_ec2_id[1]
          port      = 80
        }
      }
      tags = local.common_tags # Target Group Tags
    }
  ]
}
