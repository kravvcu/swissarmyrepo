resource "google_compute_instance" "k8s-master" {
  name = "${var.master_name_prefix}-${count.index}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      size  = "${var.master_boot_disk_size}"
      type  = "${var.master_boot_disk_type}"
      image = "${var.master_boot_disk_image}"
    }
  }
  machine_type = "${var.master_machine_type}"
  network_interface {
    subnetwork = "${var.subnetwork}"

    access_config {}
  }
  count = "${var.no_k8s_masters}"
  can_ip_forward = true
  tags = [ "group-k8s-master" ]
}

resource "google_compute_instance" "k8s-slave" {
  name = "${var.slave_name_prefix}-${count.index}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      size  = "${var.slave_boot_disk_size}"
      type  = "${var.slave_boot_disk_type}"
      image = "${var.slave_boot_disk_image}"
    }
  }
  machine_type = "${var.slave_machine_type}"
  network_interface {
    subnetwork = "${var.subnetwork}"

    access_config {}
  }

  can_ip_forward = true
  count = "${var.no_k8s_slaves}"
  tags = [ "group-k8s-slave" ]
}
