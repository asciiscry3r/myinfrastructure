//locals {
//  servers_dns_names = flatten([
//    for servers_dns_key, name in var.servers_dns : [
//      record_name = string
//      record_type = string
//      record_ttl  = number
//    ]
//  ])
//}
//
//resource "aws_route53_record" "server" {
//  //count   = length(var.servers_dns)
//  for_each = var.servers_dns
//  zone_id  = var.aws_zone_id
//  name     = var.servers_dns.value.record_name
//  type     = var.server_record_type
//  ttl      = var.server_record_ttl
//  records  = [aws_eip.server.public_ip]
//}

resource "aws_route53_record" "server" {
  zone_id = var.aws_zone_id
  name = var.server_record_name
  type = var.server_record_type
  ttl = var.server_record_ttl
  records = [
    aws_eip.server.public_ip
  ]
}