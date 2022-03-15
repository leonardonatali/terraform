resource "aws_cloudwatch_log_group" "log" {
  name              = "/aws/eks/${var.prefix}-${var.cluster_name}-log"
  retention_in_days = var.retention_in_days
}
