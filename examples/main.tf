module "iam_role" {
  source                  = "../"
  name                    = var.name
  description             = var.description
  assume_role_policy      = var.assume_role_policy
  custom_managed_policies = var.custom_managed_policies
  aws_managed_policies    = var.aws_managed_policies
}
