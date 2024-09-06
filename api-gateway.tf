resource "aws_apigatewayv2_api" "api-gateway" {
  name          = "fiap-fast-food-api-gateway"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "api-gateway" {
  api_id = aws_apigatewayv2_api.api-gateway.id

  name        = "fiap-fast-food-api-gateway-stage"
  auto_deploy = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api-gateway.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
    })
  }
}

resource "aws_cloudwatch_log_group" "api-gateway" {
  name = "/aws/api-gateway/${aws_apigatewayv2_api.api-gateway.name}"

  retention_in_days = 30
}