
# Terraform AWS Infra

A brief description of what this project does and who it's for

This repository contains Terraform code to provision an enterprise-grade infrastructure on AWS. The infrastructure includes:

    • VPC: A secure, isolated network environment with public and private subnets.
 • EC2 Instances: Configurable virtual machines in the public subnet.
 • RDS: A managed MySQL database with encryption, backups, and multi-AZ deployment.
 • S3: Buckets with server-side encryption, versioning, and access logging.
 • Security Groups: Fine-grained access control for EC2 and RDS resources.

This project is modular and scalable, making it suitable for production environments.

## Features

- VPC:

 • Custom VPC with configurable CIDR blocks.

 • Public and private subnets for secure resource placement

- EC2 Instances:

 • Dynamically provisioned using Terraform’s for_each.

 • Security groups to allow SSH and HTTP access.

- RDS:

 • MySQL database with multi-AZ, encryption, and automated backups.

 • Deployed in private subnets for added security.

- S3 Buckets:

 • Server-side encryption (AES256 or KMS).

 • Access logging and versioning enabled for data recovery.

- Security Groups:

 • EC2: Allow SSH and HTTP traffic.

 • RDS: Restrict MySQL access to private subnets.

## Getting Started

### Pre-requisites

1. Install Terraform v1.5.0+

2. Configure AWS CLI with appropriate credentials:

```bash
  aws configure
```

### How to Use

1. Clone the repository:

```bash
  git clone https://github.com/Fajobi13/terraform-aws-infra.git
  cd terraform-aws-infra
```

2. Initialize Terraform:

```bash
  terraform init
```

3. Update terraform.tfvars or environment-specific variable files (environments/dev/terraform.tfvars) with appropriate values:

```hcl
ami_id          = "ami-12345678"    # Replace with a valid AMI ID
storage         = 20
instance_class  = "db.t3.micro"
bucket_name     = "my-app-storage"
logging_bucket  = "my-app-logs"
```

4. Plan the infrastructure:

```bash
  terraform plan -var-file=environments/dev/terraform.tfvars
```

5. Deploy the infrastructure:

```bash
  terraform apply -var-file=environments/dev/terraform.tfvars
```

## Variables

#### Global Variables

| Variable | Description                | Default Value | Required     |
| :-------- | :------------------------- | :-------- | :------- |
| `aws_region` | AWS region for resources | `eu-west-2` | `Yes` |
| `default_tags` | Default tags for resources | `{}` | `Yes` |

#### VPC Variables

| Variable | Description                | Default Value | Required     |
| :-------- | :------------------------- | :-------- | :------- |
| `vpc_cidr` | CIDR block for the VPC | `10.0.0.0/16` | `Yes` |
| `public_subnet_cidrs` | Public subnet CIDRs | `{}` | `Yes` |
| `private_subnet_cidrs` | Private subnet CIDRs | `{}` | `Yes` |

#### EC2 Variables

| Variable | Description                | Default Value | Required     |
| :-------- | :------------------------- | :-------- | :------- |
| `ami_id` | Amazon Machine Image ID | `""` | `Yes` |
| `instances` | EC2 instance configurations | `{}` | `Yes` |

#### RDS Variables

| Variable | Description                | Default Value | Required     |
| :-------- | :------------------------- | :-------- | :------- |
| `storage` | Allocated storage in GB | `20` | `Yes` |
| `instance_class` | RDS instance class | `db.t3.micro` | `Yes` |
| `db_name` | Database name | `""` | `Yes` |
| `username` | Database admin username | `""` | `Yes` |
| `password` | Database admin password | `""` | `Yes` |

#### S3 Variables

| Variable | Description                | Default Value | Required     |
| :-------- | :------------------------- | :-------- | :------- |
| `bucket_name` | Name of the S3 bucket | `""` | `Yes` |
| `logging_bucket` | Name of the bucket for access logs | `""` | `Yes` |

## Outputs

| Variable | Description                |
| :-------- | :------------------------- |
| `vpc_id` | ID of the VPC |
| `public_subnet_ids` | IDs of public subnets |
| `private_subnet_ids` | IDs of private subnets |
| `ec2_instance_ids` | IDs of the EC2 instances |
| `s3_bucket_arn` | ARN of the S3 bucket |
| `rds_endpoint` | Endpoint of the RDS database |

### Best Practices

1. #### State Management

Use remote state (e.g., S3 + DynamoDB) to enable team collaboration and avoid conflicts.

2. #### Secrets Management

Store sensitive variables like passwords and API keys in a secure vault or exclude them from source control using .gitignore.

3. #### Environment Isolation

Use separate variable files for each environment (e.g., dev, test, prod).

### Contributors

- [@Fajobi13](https://www.github.com/Fajobi13)
