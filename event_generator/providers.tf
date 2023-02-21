terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
    }
    sysdig = {
      source  = "sysdiglabs/sysdig"
      version = "0.5.40"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
data "aws_region" "current" {}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "self" {}

provider "sysdig" {
  sysdig_secure_url       = "https://us2.app.sysdig.com"
  sysdig_secure_api_token = var.secure_api_token
}