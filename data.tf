data "aws_iam_policy_document" "assume_role_policy" {
  dynamic "statement" {
    for_each = var.assume_role_policy
    content {
      actions = statement.value.actions
      effect  = lookup(statement.value, "effect", "Allow")
      principals {
        type        = statement.value.principals.type
        identifiers = statement.value.principals.identifiers
      }
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  for_each = var.inline_policy
  dynamic "statement" {
    for_each = var.inline_policy[each.key]
    content {
      actions = statement.value.actions
      dynamic "condition" {
        for_each = lookup(statement.value, "condition", [])
        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
      effect      = lookup(statement.value, "effect", "Allow")
      not_actions = lookup(statement.value, "not_actions", null)
      dynamic "not_principals" {
        for_each = lookup(statement.value, "not_principals", [])
        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }
      not_resources = lookup(statement.value, "not_resources", null)
      dynamic "principals" {
        for_each = lookup(statement.value, "principals", [])
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }
      resources = statement.value.resources
      sid       = lookup(statement.value, "sid", null)
    }
  }
}

data "aws_iam_policy_document" "managed_policy" {
  for_each = var.custom_managed_policies
  dynamic "statement" {
    for_each = var.custom_managed_policies[each.key]
    content {
      actions = statement.value.actions
      dynamic "condition" {
        for_each = lookup(statement.value, "condition", [])
        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
      effect      = lookup(statement.value, "effect", "Allow")
      not_actions = lookup(statement.value, "not_actions", null)
      dynamic "not_principals" {
        for_each = lookup(statement.value, "not_principals", [])
        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }
      not_resources = lookup(statement.value, "not_resources", null)
      dynamic "principals" {
        for_each = lookup(statement.value, "principals", [])
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }
      resources = statement.value.resources
      sid       = lookup(statement.value, "sid", null)
    }
  }
}
