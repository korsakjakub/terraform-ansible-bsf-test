variable "region" {
  description = "gcp region for specified instance"
  type = string
}

variable "project" {
  description = "project name in which we will create all instance"
  type = string
}

variable "credential" {
  description = "credential file path different for different users"
  default = "keyfile.json"
}
