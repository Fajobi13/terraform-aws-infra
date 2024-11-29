variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  default     = "dev"
}

variable "ami_id" {}
variable "instances" {}
variable "bucket_name" {}
variable "logging_bucket" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "rds_security_group_id" {}
variable "backup_retention" {
  default = 7
}

variable "storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default = {
    Project     = "EnterpriseInfrastructure"
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team"
    CostCenter  = "12345"
    Environment = "dev"
  }
}