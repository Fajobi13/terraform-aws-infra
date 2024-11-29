# Terraform AWS Infra

A brief description of what this project does and who it's for

This repository contains Terraform code to provision an enterprise-grade infrastructure on AWS. The infrastructure includes:
	
    •	VPC: A secure, isolated network environment with public and private subnets.
	•	EC2 Instances: Configurable virtual machines in the public subnet.
	•	RDS: A managed MySQL database with encryption, backups, and multi-AZ deployment.
	•	S3: Buckets with server-side encryption, versioning, and access logging.
	•	Security Groups: Fine-grained access control for EC2 and RDS resources.

This project is modular and scalable, making it suitable for production environments.

## Features

- VPC:
	
	•	Custom VPC with configurable CIDR blocks.

	•	Public and private subnets for secure resource placement

-	EC2 Instances:

	•	Dynamically provisioned using Terraform’s for_each.

	•	Security groups to allow SSH and HTTP access.

-	RDS:

	•	MySQL database with multi-AZ, encryption, and automated backups.

	•	Deployed in private subnets for added security.

-	S3 Buckets:

	•	Server-side encryption (AES256 or KMS).

	•	Access logging and versioning enabled for data recovery.

-	Security Groups:

	•	EC2: Allow SSH and HTTP traffic.

	•	RDS: Restrict MySQL access to private subnets.


