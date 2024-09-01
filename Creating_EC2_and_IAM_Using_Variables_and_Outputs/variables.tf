variable "os" {
    type = string
    default = "ami-066784287e358dad1"
    description = "This is my AMI ID"
    sensitive = false
}

variable "size" {
  default = "t2.micro"
}

variable "name" {
  default = "TerraformEC2"
}

variable "bucketname" {  
}

variable "username" {
  
}