locals {
    resource_name = "${var.project_name}-${var.environment}"
    # to get first 2 availability zones in a list , use slice functon
    az_names = slice(data.aws_availability_zones.avaibale.names, 0, 2)
}