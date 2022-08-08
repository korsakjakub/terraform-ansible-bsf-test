variable "count_files" {
  default = 3
}

resource "random_id" "default" {
  byte_length = 8
  count = var.count_files
}

resource "local_file" "task2out" {
  count = var.count_files 
  content = templatefile("task2.template", {port="8080", ip_addrs=["0.0.0.0", "8.8.8.8"]})
  filename = "${path.module}/backend-${element(random_id.default.*.hex, count.index)}"
  file_permission = 0640
}