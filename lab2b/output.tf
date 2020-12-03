output "web_server_public_ip" {
    value = aws_instance.web_server.public_ip
}

output "web_server_public_dns" {
    value = aws_instance.web_server.public_dns
}

output "bastion_private_ip" {
    value = aws_instance.bastion.*.private_ip
}

output "bastion_private_ip_0" {
    value = aws_instance.bastion.*.private_ip[0]
}

output "web_server_policy_output" {
 value = data.template_file.web_server_policy_template.rendered
} 
