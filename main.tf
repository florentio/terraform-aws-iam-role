resource "aws_iam_role" "this" {
  count                = var.create ? 1 : 0
  name                 = var.name
  name_prefix          = var.name_prefix
  description          = var.description
  path                 = var.path
  max_session_duration = var.max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy.json
  dynamic "inline_policy" {
    for_each = var.inline_policy
    content {
      name   = inline_policy.key
      policy = data.aws_iam_policy_document.inline_policy[inline_policy.key].json
    }
  }
  managed_policy_arns   = concat(var.aws_managed_policies, values(aws_iam_policy.this)[*].arn)
  force_detach_policies = var.force_detach_policies
  tags                  = var.tags
}

resource "aws_iam_policy" "this" {
  for_each = var.create ? var.custom_managed_policies : {}
  name     = each.key
  policy   = data.aws_iam_policy_document.managed_policy[each.key].json
  tags     = var.tags
}
