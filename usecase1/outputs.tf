output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_dns_name
}

output "tg_a_arn" {
  value = module.tg_a.arn
}

output "tg_b_arn" {
  value = module.tg_b.arn
}

output "tg_c_arn" {
  value = module.tg_c.arn
}
