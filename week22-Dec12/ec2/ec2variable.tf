# --- compute/ec2variables.tf ---

variable "public_subnets" {}
variable "private_subnets" {}
variable "key_name" {}
variable "elb_http" {}
variable "alb_tg" {}

variable "bastion_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_db_instance" {
  type    = string
  default = "t3.micro"
}