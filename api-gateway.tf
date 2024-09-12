resource "aws_apigatewayv2_api" "api-gateway" {
  name          = "fiap-fast-food-api-gateway"
  protocol_type = "HTTP"
}