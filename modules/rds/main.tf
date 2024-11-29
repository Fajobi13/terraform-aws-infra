
resource "aws_db_instance" "db_instance" {
  allocated_storage    = var.storage
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [var.security_group_id]
  publicly_accessible  = false
  multi_az             = true
  backup_retention_period = var.backup_retention
  storage_encrypted    = true
  skip_final_snapshot  = true

  tags = merge(var.default_tags, {
    Name = "rds-${var.db_name}"
  })
}