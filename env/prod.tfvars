aws_region         = "ap-southeast-3"
name_prefix        = "app-prod"

vpc_cidr            = "10.20.0.0/16"
public_subnet_cidrs = ["10.20.1.0/24", "10.20.3.0/24"]
private_subnet_cidrs = ["10.20.2.0/24", "10.20.4.0/24"]
availability_zones  = ["ap-southeast-3a", "ap-southeast-3b"]

container_name  = "app"
container_image = "nginx:latest"
container_port  = 80

task_cpu    = 512
task_memory = 1024

desired_count     = 2
instance_type     = "t3.small"
asg_min_size      = 2
asg_max_size      = 4
asg_desired_capacity = 2

alb_listener_port = 80
alb_ingress_cidrs = ["0.0.0.0/0"]
health_check_path = "/"
log_retention_days = 14

tags = {
  Environment = "prod"
  Project     = "ecs-terraform"
}
