resource "google_compute_network" "playground-network" {
  name                    = "playground"
  auto_create_subnetworks = true
}