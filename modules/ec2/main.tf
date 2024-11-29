resource "aws_instance" "web_server" {
  for_each      = var.instances
  ami           = var.ami_id
  instance_type = each.value.instance_type
  key_name      = each.value.key_name
  subnet_id     = each.value.subnet_id
  vpc_security_group_ids = [each.value.security_group_id]


  tags = merge(var.default_tags, {
    Name = "web-server-${each.key}"
  })
}