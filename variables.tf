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