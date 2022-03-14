resource "local_file" "example" {
  content  = var.content
  filename = "local_file.txt"
}

data "local_file" "example_datasource" {
  filename = "local_file.txt"
}

variable "content" {
    type = string
    default = "This is the default content."
}

output "file-id" {
    value = local_file.example.id
}

output "file-permission" {
    value = local_file.example.file_permission
}

output "datasource-result" {
    value = data.local_file.example_datasource
}