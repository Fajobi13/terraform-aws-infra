
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

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}