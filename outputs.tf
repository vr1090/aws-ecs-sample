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

output "postgres_endpoint" {
  description = "PostgreSQL endpoint address."
  value       = aws_db_instance.postgres.address
}

output "postgres_port" {
  description = "PostgreSQL port."
  value       = aws_db_instance.postgres.port
}

output "postgres_master_secret_arn" {
  description = "Secrets Manager ARN for the managed PostgreSQL master password."
  value       = try(aws_db_instance.postgres.master_user_secret[0].secret_arn, null)
}
