output "arn" {
  value       = module.iam_role.arn
  description = "Role ARN"
}

output "name" {
  value       = module.iam_role.name
  description = "Role name"
}
