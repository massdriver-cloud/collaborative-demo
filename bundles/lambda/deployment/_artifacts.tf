resource "massdriver_artifact" "endpoint" {
  field = "endpoint"
  name  = "Endpoint: ${var.md_metadata.name_prefix}"
  artifact = jsonencode(
    {
      data = {
        api = {
          hostname = "${local.api_id}.execute-api.${var.api_gateway.specs.aws.region}.amazonaws.com"
          port     = 443
          protocol = "https"
        }
        etc = {
        }
      }
      specs = {
        api = {
          version = "1.0"
          url     = "https://${local.api_id}.execute-api.${var.api_gateway.specs.aws.region}.amazonaws.com"
        }
      }
    }
  )
}
