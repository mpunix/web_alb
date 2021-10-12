variable "aws_region" {
  description = "Name of the region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id_number" {
  description = "VPC ID"
  type        = string
  default     = "vpc-010897db39b171412"
}

variable "vpc_subnets" {
  description = "VPC subnets"
  type        = list(string)
  default     = ["subnet-04971632508caf2ef", "subnet-0e6fcb061a8be637d"]
}

variable "vpc_security_groups" {
  description = "VPC security_groups"
  type        = list(string)
  default     = ["sg-04fc9f1937cf7b2d4"]
}

variable "target_group_name" {
  description = "Instance target group name"
  type        = string
  default     = "mytargetgp"
}


variable "ec2_instances_ids" {
  description = "EC2 instances id"
  type        = list(string)
  default     = ["i-0d26581a0c00f0945", "i-011b28c5685d114fa"]
}