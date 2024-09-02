provider "aws" {
  # Configuration options
  region = "us-east-1"
  alias = "east"
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
  alias = "west"
}

provider "github" {
  # Configuration options
  token = ""
}