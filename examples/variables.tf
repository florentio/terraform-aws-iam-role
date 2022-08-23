variable "name" {
  description = "The name of the role"
  default     = "my-super-role"
  type        = string
}

variable "description" {
  description = "The description of the role"
  default     = "Mon super role"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy"
  default = [
    {
      effect = "Allow",
      principals = {
        type        = "Service",
        identifiers = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
      },
      actions = ["sts:AssumeRole"]
    },
  ]
  type = any
}

variable "custom_managed_policies" {
  description = "Custom managed policy to be created and added to the role"
  default = {
    "EC2-Policies" : [
      {
        effect = "Allow",
        actions = [
          "ec2:*"
        ],
        resources = ["*"]
      },
      {
        effect = "Allow",
        actions = [
          "elasticloadbalancing:*"
        ],
        resources = ["*"]
      }
    ],
    "S3-Policies" : [
      {
        effect = "Allow",
        actions = [
          "s3:*"
        ],
        resources = ["*"]
      }
    ]
  }
  type = any
}
variable "aws_managed_policies" {
  description = "AWS managed policies to be added to the role"
  default     = ["arn:aws:iam::aws:policy/CloudFrontFullAccess", "arn:aws:iam::aws:policy/AWSLambdaExecute"]
  type        = list(string)
}
