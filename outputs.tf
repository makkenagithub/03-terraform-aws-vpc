output "vpc_id" {
    value = aws_vpc.main.id
}

output "az_info" {
    value = data.aws_availability_zones.avaibale
}

output "default_vpc_info" {
    value = data.aws_vpc.default
}