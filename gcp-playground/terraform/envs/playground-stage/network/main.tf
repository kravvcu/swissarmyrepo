resource "google_compute_network" "playground-network" {
  name                    = "playground"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "playground-subnet" {
  name          = "playground"
  region        = "${var.region}"
  network       = "${google_compute_network.playground-network.self_link}"
  ip_cidr_range = "${var.ip_cidr}"
}
