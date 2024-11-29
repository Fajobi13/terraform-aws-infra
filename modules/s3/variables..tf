variable "bucket_name" {}
variable "logging_bucket" {}
variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
}