output "node_role_arn" {
  value = aws_iam_role.node-role.arn
}

output "cluster_role_arn" {
  value = aws_iam_role.cluster_role.arn
}
