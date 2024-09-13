resource "aws_api_gateway_rest_api" "api-gateway" {
  name        = "fiap-fast-food-api-gateway"
  description = "Main AWS API Gateway to Tech Challenge's phase 3"
}

provider "aws" {
  # Configuration options
}