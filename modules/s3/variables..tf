# S3 Variables
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "logging_bucket" {
  description = "The target S3 bucket for storing access logs"
  type        = string
}
variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
}