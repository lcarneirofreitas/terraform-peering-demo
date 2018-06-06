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
resource "aws_security_group" "allow_http" {
 description = "Allow HTTP access"
 name = "allow_http"
 vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
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
