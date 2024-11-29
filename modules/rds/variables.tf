
variable "storage" {}
variable "instance_class" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "backup_retention" {
  default = 7
}
variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
}
variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}