data "aws_availability_zones" "avaibale" {
    state = "available"
}

# get the default vpc details
data "aws_vpc" "default" {
  default = true
}