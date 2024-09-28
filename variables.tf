# mandatory
variable "project_name" {
    type = string
}

#mandatory
variable "environment" {
    type = string
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"

}

variable "enable_dns_hostnames" {
    default = true
}

#optional
variable "common_tags" {
    default = {
    }
}

#optional
variable "vpc_tags" {
    default = {

    }
}

#optional
variable "igw_tags" {
    default = {

    }
}

#optional
variable "public_subnet_tags" {
    default = {

    }
}

#optional
variable "private_subnet_tags" {
    default = {

    }
}

#optional
variable "database_subnet_tags" {
    default = {

    }
}

#optional
variable "database_subnet_group_tags" {
    default = {

    }
}

#optional
variable "nat_gateway_tags" {
    default = {

    }
}

#optional
variable "public_route_table_tags" {
    default = {

    }
}

#optional
variable "private_route_table_tags" {
    default = {

    }
}

#optional
variable "database_route_table_tags" {
    default = {

    }
}

#restrict the user to give only 2 CIDRs for high availability 1a, 1b
# we use size valdation here
variable "public_subnet_cidrs" {
    type = list

    validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "Please provide two valid public subnet CIDRs"
    }

}

#restrict the user to give only 2 CIDRs for high availability 1a, 1b
# we use size valdation here
variable "private_subnet_cidrs" {
    type = list

    validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "Please provide two valid private subnet CIDRs"
    }

}

#restrict the user to give only 2 CIDRs for high availability 1a, 1b
# we use size valdation here
variable "database_subnet_cidrs" {
    type = list

    validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "Please provide two valid database subnet CIDRs"
    }

}

variable "is_peering_required" {
    type = bool
    default = false
    
}

