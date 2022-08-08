variable "machine_type" {
  description = "specified image id for instance"
  default = "n1-standard-1"
}

variable "region" {
  description = "gcp region for specified instance"
  type = string
}

variable "project" {
  description = "project name in which we will create all instance"
  type = string
}

variable "image_name" {
  description = "image type for given instance"
  type = string
  default = "ubuntu-2204-jammy-v20220712a"
}

variable "network" {
  description = "network for given instance"
  default = "default"
}

variable "credential" {
  description = "credential file path different for different users"
  default = "keyfile.json"
}

variable "tags" {
  type = list
  description = "tags is used for defining the rule of a instance"
  default=["ansible-payload"]
}

variable "open_ports" {
  type = list
  description = "List of all open ports on a VM"
  default = ["80", "443"]
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_client_id" {
  type = string
}

variable "azure_secret" {
  type = string
}

variable "azure_tenant" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "bucket_name" {
  type = string
}