resource "aws_instance" "example" {
  key_name = "mykey"
  ami = "ami-58d7e821"
  subnet_id = "${aws_subnet.main-public-1.id}"
  instance_type = "t2.micro"
  security_groups = [ 	"${aws_security_group.allow_ssh.id}",
			"${aws_security_group.allow_http.id}",
			"${aws_security_group.allow_icmp.id}",
			"${aws_security_group.allow_net.id}" ]

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "file" {
    source = "index.nginx-debian.html"
    destination = "/tmp/index.nginx-debian.html"
  }
  provisioner "file" {
    source = "cidao.jpg"
    destination = "/tmp/cidao.jpg"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    user = "ubuntu"
    private_key = "${file("mykey")}"
    agent = "false"
  }
}

output "ip" {
    value = "${aws_instance.example.public_ip}"
}

