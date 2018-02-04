resource "google_compute_instance" "test" {
  name = "test"
  boot_disk {
    initialize_params {
      size  = "100"
      type  = "pd-standard"
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  machine_type = "n1-standard-1"
  network_interface {
    network = "default"

    access_config {

    }
  }
}
