#################
# Security Groups
#################
resource "aws_security_group" "allow_ssh" {
 description = "Allow SSH access"
 name = "allow_ssh"
 vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
resource "aws_security_group" "allow_icmp" {
 description = "Allow ICMP access"
 name = "allow_icmp"
 vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
resource "aws_security_group" "allow_net" {
 description = "All Out access"
 name = "allow_net"
 vpc_id = "${aws_vpc.main.id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
