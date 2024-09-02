#create ec2 instances
resource "aws_instance" "instance1" {
  ami           = var.os
  instance_type = "t2.micro"
  provider = aws.east

  tags = {
    Name = "HelloWorld"
  }
}

#create ec2 instances
resource "aws_instance" "instance2" {
  ami           = "ami-05134c8ef96964280"
  instance_type = "t2.micro"
  provider = aws.west

  tags = {
    Name = "HelloWorld2"
  }
}

resource "github_repository" "repo1" {
  name        = "Test_Repo"
  description = "This repo was created using Terraform"

  visibility = "public"
}

resource "github_repository" "repo2" {
  name        = "Test_Repo_2"
  description = "This repo was created using Terraform"

  visibility = "private"
}

