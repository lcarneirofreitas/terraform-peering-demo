##############
# Internet VPC
##############
resource "aws_vpc" "main" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main"
    }
}

#############
# Internet GW
#############
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

#########
# Subnets
#########
resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "192.168.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.AWS_REGION}a"

    tags {
        Name = "${var.PUBLIC_NET}-1"
    }
}

##############
# Route Tables
##############
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags {
        Name = "main-public-1"
    }
}

####################
# Route Associations
####################
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}

output "vpc_id" {
    description = "The ID of the VPC"
    value = "${aws_vpc.main.id}"
}