aws_region         = "ap-southeast-3"
name_prefix        = "app-staging"

vpc_cidr            = "10.10.0.0/16"
public_subnet_cidrs = ["10.10.1.0/24", "10.10.3.0/24"]
private_subnet_cidrs = ["10.10.2.0/24", "10.10.4.0/24"]
availability_zones  = ["ap-southeast-3a", "ap-southeast-3b"]

container_name  = "app"
container_image = "nginx:latest"
container_port  = 80

task_cpu    = 256
task_memory = 512

desired_count     = 1
instance_type     = "t3.micro"
asg_min_size      = 1
asg_max_size      = 2
asg_desired_capacity = 1

alb_listener_port = 80
alb_ingress_cidrs = ["0.0.0.0/0"]
health_check_path = "/"
log_retention_days = 7

tags = {
  Environment = "staging"
  Project     = "ecs-terraform"
}
