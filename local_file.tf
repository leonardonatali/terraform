resource "local_file" "example" {
  content  = var.content
  filename = "local_file.txt"
}

variable "content" {
    type = string
    default = "This is the default content"
}