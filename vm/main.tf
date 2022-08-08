terraform {
 backend "gcs" {
   bucket  = "bucket-tfstate-087a1ede07d3df3f"
   prefix  = "terraform/state"
 }
}

resource "google_compute_instance" "default" {
  count        = "${var.vm_count}"
  name         = "${var.instance_name}-${count.index}"
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

  metadata_startup_script = "${join("\n", ["${file("env_vars.sh")}", "${file("ansible_payload.sh")}"])}"
}

resource "google_compute_firewall" "default" {
    name = "web-firewall"
    network = "default"

    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports = "${var.open_ports}"
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web"]
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
