# RDS Variables
variable "storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default = "my_sql"
}

variable "project_name" {
  description = "Name of the project for tagging and identification"
  type        = string
}

variable "db_username" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "backup_retention" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
}