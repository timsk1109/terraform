provider "aws" {
	alias = "first"
	region = "us-east-2"
}
provider "aws"{
	alias = "second"
	region = "us-east-1"
}
variable "instance_type"{
	type = string
}

variable "ami_id" {
	description = "ami value"
}


resource "aws_instance" "web-01" {
	provider = "aws.second"
	instance_type = "var.instance_type_value"
	ami = "var.ami_id"
	count = 2
}
output "public_ip" {
	value = aws_instance.web-01.public_ip
}

resource "aws_s3_bucket" "s3_bucket" {
	provider = "aws.second"
	bucket = "mango098"
}
