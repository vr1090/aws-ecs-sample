variable "aws_region" {
  description = "AWS region to deploy to."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for naming resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "alb_listener_port" {
  description = "Listener port for the ALB."
  type        = number
  default     = 80
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to reach the ALB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "container_name" {
  description = "Name of the container in the task definition."
  type        = string
}

variable "container_image" {
  description = "Container image for the task definition."
  type        = string
}

variable "container_port" {
  description = "Container port exposed by the task."
  type        = number
}

variable "task_cpu" {
  description = "CPU units for the task."
  type        = number
}

variable "task_memory" {
  description = "Memory (MiB) for the task."
  type        = number
}

variable "health_check_path" {
  description = "HTTP path for target group health checks."
  type        = string
  default     = "/"
}

variable "log_retention_days" {
  description = "CloudWatch Logs retention in days."
  type        = number
  default     = 7
}

variable "desired_count" {
  description = "Number of desired tasks."
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type for ECS cluster capacity."
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  description = "Minimum number of ECS instances."
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum number of ECS instances."
  type        = number
  default     = 2
}

variable "asg_desired_capacity" {
  description = "Desired number of ECS instances."
  type        = number
  default     = 1
}

variable "db_name" {
  description = "Initial PostgreSQL database name."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for PostgreSQL."
  type        = string
  default     = "appadmin"
}

variable "db_port" {
  description = "Port for PostgreSQL."
  type        = number
  default     = 5432
}

variable "db_allocated_storage" {
  description = "Initial allocated storage (GiB) for PostgreSQL."
  type        = number
  default     = 20
}

variable "tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default     = {}
}
