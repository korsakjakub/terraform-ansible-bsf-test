provider "google" {
  credentials = "${file(var.credential)}"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "random_id" "instance_id" {
    byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "bucket-tfstate-${random_id.instance_id.hex}"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
