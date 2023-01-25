output "instance_ip" {
    value = aws_instance.cron-server.*.public_ip
}
output "instance_state" {
    value = aws_instance.cron-server.instance_state
}
output "arn_kms" {
  value = aws_kms_key.mykey.arn
}