output "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  value       = values(aws_instance.web_server)[*].id
}