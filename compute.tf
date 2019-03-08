resource "google_compute_instance" "vm_shopfront" {
  count = 1
  name = "shopfront-instance-${count.index}"
  machine_type = "${var.instance_type}"
  zone = "${var.region_zone}"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "${google_compute_network.shop.name}"
    access_config = {
    }
  }

  metadata {
   sshKeys = "${var.ssh_username}:${file("${var.public_key_path}")}"
  }

  provisioner "file" {
      source      = "${var.shopfront_install_script_src_path}"
      destination = "${var.install_script_dest_path}"

      connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
      }
  }

  provisioner "remote-exec" {
    connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
    }

    inline = [
        "chmod +x ${var.install_script_dest_path}",
        "echo \"server.port=${var.shopfront_port}\" >> application.properties",
        "echo \"productCatalogueUri=http://\"${google_compute_forwarding_rule.productcatalogue.ip_address}:${var.productcatalogue_port}\"\" >> application.properties",
        "echo \"stockManagerUri=http://\"${google_compute_forwarding_rule.stockmanager.ip_address}:${var.stockmanager_port}\"\" >> application.properties",
        "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }

  service_account {
      scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}

resource "google_compute_instance" "vm_productcatalogue" {
  count = 1
  name = "productcatalogue-instance-${count.index}"
  machine_type = "${var.instance_type}"
  zone = "${var.region_zone}"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "${google_compute_network.shop.name}"
    access_config = {
    }
  }

  metadata {
   sshKeys = "${var.ssh_username}:${file("${var.public_key_path}")}"
  }

  provisioner "file" {
      source      = "${var.productcatalogue_install_script_src_path}"
      destination = "${var.install_script_dest_path}"

      connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
      }
  }

  provisioner "remote-exec" {
    connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
    }

    inline = [
        "chmod +x ${var.install_script_dest_path}",
        "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }

  service_account {
      scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}

resource "google_compute_instance" "vm_stockmanager" {
  count = 1
  name = "stockmanager-instance-${count.index}"
  machine_type = "${var.instance_type}"
  zone = "${var.region_zone}"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "${google_compute_network.shop.name}"
    access_config = {
    }
  }

  metadata {
   sshKeys = "${var.ssh_username}:${file("${var.public_key_path}")}"
  }

  provisioner "file" {
      source      = "${var.stockmanager_install_script_src_path}"
      destination = "${var.install_script_dest_path}"

      connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
      }
  }

  provisioner "remote-exec" {
    connection {
        type        = "ssh"
        user        = "${var.ssh_username}"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
    }

    inline = [
        "chmod +x ${var.install_script_dest_path}",
        "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }

  service_account {
      scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}
