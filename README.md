# terraform-aws-iam-role
Terraform module which creates IAM Role on AWS

<!-- BEGIN_TERRAFORM_DOCS -->
## Table of content

- [Example of usage](#example-of-usage)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Authors](#authors)

## Example of usage

```hcl
module "iam_role" {
  source                  = "../"
  name                    = var.name
  description             = var.description
  assume_role_policy      = var.assume_role_policy
  custom_managed_policies = var.custom_managed_policies
  aws_managed_policies    = var.aws_managed_policies
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.managed_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | Specify the assume role policy. If not specified, it will fallback on ec2.amazonaws.com | `any` | <pre>[<br>  {<br>    "actions": [<br>      "sts:AssumeRole"<br>    ],<br>    "principals": {<br>      "identifiers": [<br>        "ec2.amazonaws.com"<br>      ],<br>      "type": "Service"<br>    }<br>  }<br>]</pre> | no |
| <a name="input_aws_managed_policies"></a> [aws\_managed\_policies](#input\_aws\_managed\_policies) | Specify the AWS managed policies you want to attach to the role | `list(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether or not the log group resource will be created | `bool` | `true` | no |
| <a name="input_custom_managed_policies"></a> [custom\_managed\_policies](#input\_custom\_managed\_policies) | Specify the custom managed policies you want to create and added to the role | `any` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the role | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Whether to force detaching any policies the role has before destroying it | `bool` | `false` | no |
| <a name="input_inline_policy"></a> [inline\_policy](#input\_inline\_policy) | Specify the inline policy you want to apply | `any` | `{}` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used for the IAM role | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of IAM role | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the role |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | Creation date of the IAM role. |
| <a name="output_id"></a> [id](#output\_id) | Id of the role |
| <a name="output_name"></a> [name](#output\_name) | Name of the role |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Stable and unique string identifying the role |



## License
Apache-2.0 Licensed. See [LICENSE](https://github.com/florentio/terraform-aws-iam-role/blob/main/LICENSE).
<!-- END_TERRAFORM_DOCS -->
