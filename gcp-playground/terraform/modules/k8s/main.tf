resource "google_compute_instance" "k8s_master" {
  name = "${var.master_name}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      size  = "${var.master_boot_disk_size}"
      type  = "${var.master_boot_disk_type}"
      image = "${var.master_boot_disk_size}"
    }
  }
  machine_type = "${var.master_machine_type}"
  network_interface {
    subnetwork = "${var.subnetwork}"

    access_config {}
  }
}
