variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "redis-client"
}

variable "instance_size" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Value of the AMI for the EC2 instance"
  type        = string
  default     = "ami-080e1f13689e07408"
}
variable "aws-profile" {
  description = "Credential Profile for aws"
  type = string
  default = "terraform"
}
variable "ssh-key-path" {
  description = "Ssh key path for ec2 instance"
  type = string
}
variable "init-script" {
    description = "Ssh key path for ec2 instance"
    type = string
    default = ""
}