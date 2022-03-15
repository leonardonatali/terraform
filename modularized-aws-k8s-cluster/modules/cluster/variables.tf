variable "prefix" {}
variable "cluster_name" {}
variable "desired_size" { type = number }
variable "max_size" { type = number }
variable "min_size" { type = number }
variable "security_group_id" { type = string }
variable "cluster_role_arn" { type = string }
variable "node_role_arn" { type = string }
variable "subnet_ids" { type = list(string) }
