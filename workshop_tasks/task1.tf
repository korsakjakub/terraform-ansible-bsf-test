resource "local_file" "bsf_school_test" {
  content = "Uszanowanko"
  filename = "${path.module}/test_file.txt"
  file_permission = 0640
}