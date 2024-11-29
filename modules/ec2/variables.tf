
variable "ami_id" {}

variable "instances" {
  type = map(object({
    instance_type    = string
    key_name         = string
    subnet_id        = string
    security_group_id = string
  }))
}

variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
}