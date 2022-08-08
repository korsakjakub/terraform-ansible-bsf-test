variable "id" {
    type string
}

resource "random_id" "default" {
    byte_length = 8
}

resource "local_file" "task2out" {
    content = templatefile("task2.template", {port=8080, ip_addrs=[0.0.0.0, 8.8.8.8]})
    filename = "${path.module}/backend-${random_id.default.hex}"
    file_permission = 0640
}