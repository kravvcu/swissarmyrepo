resource "google_compute_instance" "test" {
  name = "test"
  zone = "europe-west2-a"
  boot_disk {
    initialize_params {
      size  = "100"
      type  = "pd-standard"
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  machine_type = "n1-standard-1"
  network_interface {
    network = "${data.terraform_remote_state.network.network_name}"

    access_config {

    }
  }
}
