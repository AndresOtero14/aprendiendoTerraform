terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
  required_version = "1.9.2"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

provider "aws" {
  # Configuration options
  region = "us-east-2"
  alias = "ohio"
}