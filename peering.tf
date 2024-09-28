# create VPC peering only if user requires it.

resource "aws_vpc_peering_connection" "peering" {

  count = var.is_peering_required ? 1 : 0

  # peer_owner_id = var.peer_owner_id # optional if we are using same account
  peer_vpc_id   = aws_vpc.default.id    # Acceptor / target VPC id
  vpc_id        = aws_vpc.main.id     # requester VPC id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between foo and bar"
  }
}