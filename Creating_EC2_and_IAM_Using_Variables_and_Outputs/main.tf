#create ec2 instances
resource "aws_instance" "instance1" {
  ami           = var.os
  instance_type = var.size
  provider = aws.east

  tags = {
    Name = var.name
  }
}

#create ec2 instances
resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucketname
}

#create IAM User
resource "aws_iam_user" "user1"{
  name = "${var.username}-user"
}

#create IAM User
resource "aws_iam_user" "user2"{
  name = "${var.username}-user"
}

#get output
output "IPAddress"{
  value = aws_instance.instance1.public_ip
}

#get output
output "DNS"{
  value = aws_instance.instance1.public_dns
}