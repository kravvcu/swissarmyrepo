data "http" "own-ip" {
  url = "https://ipinfo.io/ip"
}

resource "google_compute_firewall" "permit-all-self" {
  name = "${var.environment-prefix}-permit-all-self"

  network = "${data.terraform_remote_state.network.outputs.network_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [ "${chomp(data.http.own-ip.body)}/32" ]
}

resource "google_compute_firewall" "permit-subnetwork-traffic" {
  name = "${var.environment-prefix}-permit-subnetwork-traffic"
  network = "${data.terraform_remote_state.network.outputs.network_name}"
  source_ranges = [ "${data.terraform_remote_state.network.outputs.subnetwork_ipv4_cidr}" ]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
}
