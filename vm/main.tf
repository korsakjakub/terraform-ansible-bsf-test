terraform {
 backend "gcs" {
   bucket  = ## BUCKET CREATED WITH THE FIRST TF SCRIPT "bucket-tfstate-41059f6442f78075"
   prefix  = "terraform/state"
 }
}

resource "google_compute_instance" "default" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  tags         = "${var.tags}"
  zone         = "${var.region}"

  labels = {
    environment = "dev"
  }

  boot_disk {
    initialize_params {
      image = "${var.image_name}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      # nat_ip = "${google_compute_address.static.address}"
    }
  }

  metadata_startup_script  = "${file("./ansible_payload.sh")}"
}

resource "google_compute_firewall" "default" {
    name = "web-firewall"
    network = "default"

    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports = ["80", "443"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web"]
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
