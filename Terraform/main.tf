provider "aws" {
	region = var.region
}

resource "aws_vpc" "s_vpc" {
	tags = {
		Name: "${var.env}-vpc"
	}
	cidr_block = var.vpc_cidr
}

resource "aws_subnet" "s_subnet" {
	tags = {
		Name: "${var.env}-subnet"
	}
	vpc_id = aws_vpc.s_vpc.id
	cidr_block = var.subnet_cidr
	availability_zone = var.zone
}

resource "aws_internet_gateway" "s_igw" {
	tags = {
		Name: "${var.env}-igw"
	}
	vpc_id = aws_vpc.s_vpc.id
}

resource "aws_default_route_table" "s_route_table" {
	tags = {
		Name: "${var.env}-route-table"
	}
	default_route_table_id = aws_vpc.s_vpc.default_route_table_id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.s_igw.id
	}
}

resource "aws_default_security_group" "s_sg" {
	tags = {
		Name: "${var.env}-sg"
	}
	vpc_id = aws_vpc.s_vpc.id
	ingress {
		from_port = 22
		to_port = 22
		protocol = "TCP"
		cidr_blocks = [var.personal_ip]
	}
	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

data "aws_ami" "s_ami" {
	most_recent = true
	filter {
		name = "name"
		values = ["al*"]
	}
}

resource "aws_instance" "s_instance" {
	instance_type = var.instance
	availability_zone = var.zone
	ami = data.aws_ami.s_ami.id
	subnet_id = aws_subnet.s_subnet.id
	vpc_security_group_ids = [aws_default_security_group.s_sg.id]
	associate_public_ip_address = true
	key_name = var.key_name
	tags = {
		Name: "${var.env}-instance"
	}
}

output "ec2_public_ip" {
	value = aws_instance.s_instance.public_ip
}