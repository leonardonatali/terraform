variable "prefix" {
  type    = string
  default = "k8s-cluster"
}

variable "cluster_name" {
  type    = string
  default = "k8s-cluster"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "retention_in_days" {
  type    = number
  default = 15
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "min_size" {
  type    = number
  default = 2
}
