resource "aws_instance" "example" {
  key_name = "mykey"
  ami = "ami-58d7e821"
  subnet_id = "${aws_subnet.main-public-1.id}"
  instance_type = "t2.micro"
  security_groups = [ 	"${aws_security_group.allow_ssh.id}",
			"${aws_security_group.allow_icmp.id}",
			"${aws_security_group.allow_net.id}" ]
}
output "ip" {
    value = "${aws_instance.example.public_ip}"
}

