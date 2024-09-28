# create VPC peering only if user requires it.

resource "aws_vpc_peering_connection" "peering" {

  count = var.is_peering_required ? 1 : 0

  # peer_owner_id = var.peer_owner_id # optional if we are using same account
  peer_vpc_id   = data.aws_vpc.default.id    # Acceptor / target VPC id
  vpc_id        = aws_vpc.main.id     # requester VPC id
  auto_accept   = true  # accept the peering request automatically

   tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}-default"  #expense-dev-default
    }
   )
}

# add route with public subnet
resource "aws_route" "public_peering" {

  count = var.is_peering_required ? 1 : 0

  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}

# add route with private subnet
resource "aws_route" "private_peering" {

  count = var.is_peering_required ? 1 : 0

  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}

# add route with database subnet also, if required
resource "aws_route" "database_peering" {

  count = var.is_peering_required ? 1 : 0

  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}

# add the route from default VPC route table to our created VPC
resource "aws_route" "default_peering" {

  count = var.is_peering_required ? 1 : 0

  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id

}