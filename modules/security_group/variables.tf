
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
}

variable "allowed_db_cidrs" {
  description = "CIDR blocks allowed for database access"
  type        = list(string)
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}