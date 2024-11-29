variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of the project for tagging and identification"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  default     = "dev"
}


# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = map(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = map(string)
}

variable "ami_id" {}
variable "instances" {}
variable "bucket_name" {}
variable "logging_bucket" {}
variable "db_name" {}
variable "rds_security_group_id" {}

variable "db_username" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
}
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
    Project     = "terraform-aws-infra"
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team"
    CostCenter  = "12345"
    Environment = "dev"
  }
}