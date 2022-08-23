variable "create" {
  description = "Whether or not the log group resource will be created"
  default     = true
  type        = bool
}

variable "assume_role_policy" {
  description = "Specify the assume role policy. If not specified, it will fallback on ec2.amazonaws.com"
  default = [{
    principals = {
      type        = "Service",
      identifiers = ["ec2.amazonaws.com"]
    },
    actions = ["sts:AssumeRole"]
  }]
  type = any
}

variable "inline_policy" {
  description = "Specify the inline policy you want to apply"
  default     = {}
  type        = any
}

variable "custom_managed_policies" {
  description = "Specify the custom managed policies you want to create and added to the role"
  default     = {}
  type        = any
}

variable "aws_managed_policies" {
  description = "Specify the AWS managed policies you want to attach to the role"
  default     = []
  type        = list(string)
}

variable "name" {
  description = "Name to be used for the IAM role"
  default     = null
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix"
  default     = null
  type        = string
}

variable "force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it"
  default     = false
  type        = bool
}

variable "path" {
  description = "Path of IAM role"
  default     = null
  type        = string
}

variable "description" {
  description = "Description of the role"
  default     = null
  type        = string
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  default     = 3600
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  default     = {}
  type        = map(string)
}
