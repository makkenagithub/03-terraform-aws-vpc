VPC:

VPC is a isolated data center in cloud. Resources created inside VPC is comletely private.

CIDR - classless interdomain routing

VPC:

10.0.0.0/16 is a CIDR for a VPC

subnets:

10.0.0.0/24 is a subnet in VPC

10.0.1.0/24 is another subnet in the VPC assume its frontend subnet (public)

10.0.2.0/24 (backend) subnet

10.0.3.0/24 (DB) subnet

etc

Internet gateway:

create an internet gateway and attach it to a VPC

Create a route table (public) and edit it with the internet gateway. means 0.0.0.0/0 with the above created iternet gateway.

Now assosiate the route table with the frontend subnet

public subnet and private subnet:

the subnet which has internet connection is called public subnet

Private subnet does not have internet connection as routes

Create another route table (private - backend) and associate with backend subnet

Create another route table (private - DB) and associate with DB subnet

Revision:

1. create VPC.
2. create internet GW and attach to VPC.
3. create public, private(backend) and DB subnets.
4. create public, private (backend) and DB route tables and associate them with corresponding subnets.

servers cant be reached directly are incoming / ingress traffic.

traffic from the servers is outgoing/egress traffic

NAT (network address translation) :

When we call a command dnf install mysql-server in DB servers (private subnet servers), the request goes to internet and installs the mysql server. But the traffic is outgoing which allowd through a gateway called NAT gateway.

NAT is the mechanism private servers connect to internet for outgoing traffic like packages installation, security patches download etc

NAT - when server stops and starts IP address wll change. It should have same IP always (statc IP / elastic IP)

Craete an elastic IP. Click on Allocate Elastic IP , we get a public IP.

Create  NAT gateway. Give a name and select  the public subnet. Connection type public. Take the above created elstic IP.

Edit the private (backend and DB) route tables. Edit routes -> Add route -> 0.0.0.0/0 -> NAT gateway -> select the above created NAT gateway.


High Availability:

If our servers available in multiple availablty zones (us-east-1a, us-east-1b) , then its high availability. But its not DR.

If our servers exists in multiple regions , then its DR

We cant create servers without subnet. So we have to create 

1. 1 public (forontend) subnet in us-east-1a , 1 public (forontend) subnet in us-east-1b
2. 1 private (backend) subnet in us-east-1a , 1 private (backend) subnet in us-east-1b
3. 1 private (DB) subnet in us-east-1a , 1 private (DB) subnet in us-east-1b

The procedure for creating a VPC is same for any project. Hence its better to create a terraform module for VPC and reuse it.

VPC Peering:

By default VPCs are not connecte each other.

VPC peering can etablish connection between two VPCs. VPC CIDRs should be different, they should not overlap.

If VPC 1 wants to connect to VPC 2. VPC 1 is called requester. VPC 2 is acceptor.

VPCs can be peering even if they are from different AWS accounts and different regions.

1. create 2 VPCs
2. goto Peering, then create -> provide VPC 2 ID and its details such as same account or different accounts. Then create peering.
3. Goto VPC 2 and accept the VPC peering request from VPC 1.

Now 2 VPCs are connected. Then we need to add routes, which subnets needs to interact each other.

We need to edit the routes. Goto VPC 1-> Route tables-> edit routes -> give th CIDR of other VPC 2-> choose peering connection, then its ID pcx-1345. 

Similarly edit the routes of VPC 2 also, to get the response.



