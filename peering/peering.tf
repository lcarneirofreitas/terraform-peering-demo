resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "vpc-02657179"
  peer_vpc_id   = "vpc-a4f987c2"
  peer_owner_id = "136856413626"
  peer_region   = "us-west-1"
  auto_accept   = true

  tags {
    Side = "Requester"
  }
}
