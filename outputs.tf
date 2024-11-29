output "ec2_instance_ids" {
  value = module.ec2.ec2_instance_ids
}

output "s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}