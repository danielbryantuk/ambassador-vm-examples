resource "google_compute_instance" "vm_shopfront" {
  count = 1
  name = "shopfront-instance-${count.index}"
  machine_type = "${var.instance_type}"
  zone = "${var.region_zone}"

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "default"
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
        "echo \"${google_compute_instance.vm_productcatalogue.0.network_interface.0.access_config.0.nat_ip}\" >> productcatalogue_ip.txt",
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

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "default"
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

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    network = "default"
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
