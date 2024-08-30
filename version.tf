terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.95.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "hcp" {
  # Configuration options
}

provider "aws" {
  # Use access key and secret key from dev-programmatic-admin
}