# 03-terraform-aws-vpc
# Terraform AWS VPC module customised

This module s going to create the following resources, for HA we get fist two AZ in the region

It creates folling resources

* vpc
* internet gateway associated with vpc
* 2 public subnets, 2 private subnets, 2 db subnets
* DB subnet grouping
* Elastic IP
* NAT gateway
* routes
* public route table, private route table, db route table
* route table association with subnets
* peering with default VPC ( if required)
* peering routes in requiestor and acceptor toute tables

# mandatory inputs
* Project name 
* environment
* vpc_cidr
* public, private, db subnet cidrs (only 2 cidrs accepted for each)

# optional inputs
* common tags and other resource tags (default empty)
* enable_dns_hostnames (default true)

# outputs
* subnet IDs of public, private and database subnets
