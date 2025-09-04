output "subnet" {
  value = aws_subnet.main.id
}

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}