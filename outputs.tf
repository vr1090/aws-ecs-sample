output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = module.vpc.public_subnets[0]
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = module.vpc.private_subnets[0]
}

output "ecs_cluster_id" {
  description = "ID of the ECS cluster."
  value       = module.ecs_cluster.id
}

output "ecs_service_name" {
  description = "Name of the ECS service."
  value       = module.ecs_service.name
}

output "alb_dns_name" {
  description = "DNS name of the ALB."
  value       = module.alb.lb_dns_name
}
