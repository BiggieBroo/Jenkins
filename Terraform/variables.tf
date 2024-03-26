variable "env" {
	default = "dev"
}
variable "zone" {
	default = "eu-west-3a"
}
variable "vpc_cidr" {
	default = "10.0.0.0/16"
}
variable "subnet_cidr" {
	default = "10.0.1.0/24"
}
variable "instance" {
	default = "t2.micro"
}
variable "personal_ip" {
	default = "193.225.62.109/32"
}
variable "region" {
	default = "eu-west-3"
}
variable "key_name" {
	default = "dev-key-pair"
}