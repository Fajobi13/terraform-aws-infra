terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.70.0"
    }
  }

  # backend "s3" {
  #   bucket         = "enterprise-terraform-state"
  #   key            = "global/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }
}

provider "aws" {
  region = var.aws_region
}

locals {
  # Dynamically generate the database name
  dynamic_db_name = "${var.project_name}-${var.environment}-db"
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidrs   = { subnet1 = "10.0.1.0/24", subnet2 = "10.0.2.0/24" }
  private_subnet_cidrs  = { subnet1 = "10.0.3.0/24", subnet2 = "10.0.4.0/24" }
  default_tags          = var.default_tags
  project_name          = var.project_name
}

module "security_group" {
  source            = "./modules/security_group"
  vpc_id            = module.vpc.vpc_id
  allowed_ssh_cidrs = ["192.168.1.0/24"]
  allowed_db_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
  default_tags      = var.default_tags
  project_name      = var.project_name
}

module "ec2" {
  source       = "./modules/ec2"
  ami_id       = var.ami_id
  instances    = {
    instance1 = {
      instance_type    = "t2.micro"
      key_name         = "dev-key"
      subnet_id        = module.vpc.public_subnet_ids["subnet1"]
      security_group_id = module.security_group.ec2_sg_id
    }
  }
  default_tags = var.default_tags
}

module "rds" {
  source            = "./modules/rds"
  storage           = var.storage
  instance_class    = var.instance_class
  db_name           = "my_database"
  username          = "admin"
  password          = "my_password"
  subnet_ids        = values(module.vpc.private_subnet_ids) # Private subnets
  security_group_id = module.security_group.rds_sg_id
  backup_retention  = var.backup_retention
  default_tags      = var.default_tags
}

module "s3" {
  source        = "./modules/s3"
  bucket_name   = var.bucket_name
  logging_bucket = var.logging_bucket
  default_tags  = var.default_tags
}

