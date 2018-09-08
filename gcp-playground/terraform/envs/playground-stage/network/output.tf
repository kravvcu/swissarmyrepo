output "network_name" {
  value = "${google_compute_network.playground-network.name}"
}

output "subnetwork_name" {
  value = "${google_compute_subnetwork.playground-subnet.name}"
}

output "subnetwork_ipv4_cidr" {
  value = "${google_compute_subnetwork.playground-subnet.ip_cidr_range}"
}
