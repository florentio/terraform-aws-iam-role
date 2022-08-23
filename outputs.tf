output "arn" {
  value       = try(aws_iam_role.this[0].arn, "")
  description = "ARN of the role"
}

output "id" {
  value       = try(aws_iam_role.this[0].id, "")
  description = "Id of the role"
}

output "name" {
  value       = try(aws_iam_role.this[0].name, "")
  description = "Name of the role"
}

output "create_date" {
  value       = try(aws_iam_role.this[0].create_date, "")
  description = "Creation date of the IAM role."
}

output "unique_id" {
  value       = try(aws_iam_role.this[0].unique_id, "")
  description = "Stable and unique string identifying the role"
}
