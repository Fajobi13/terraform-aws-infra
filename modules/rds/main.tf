
resource "aws_db_instance" "db_instance" {
  allocated_storage       = var.storage
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.db_username     # Corrected variable
  password                = var.db_password     # Corrected variable
  vpc_security_group_ids  = [var.security_group_id]
  publicly_accessible     = false
  multi_az                = true
  backup_retention_period = var.backup_retention
  storage_encrypted       = true
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.main.name

  tags = merge(var.default_tags, {
    Name    = "rds-${var.db_name}",
    Project = var.project_name
  })
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.default_tags, {
    Name    = "${var.db_name}-subnet-group",
    Project = var.project_name
  })
}