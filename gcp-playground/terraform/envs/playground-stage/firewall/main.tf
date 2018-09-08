data "http" "own-ip" {
  url = "https://ipinfo.io/ip"
}

resource "google_compute_firewall" "permit-ssh-icmp-self" {
  name = "${var.environment-prefix}-permit-ssh-icmp-self"

  network = "${data.terraform_remote_state.network.network_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }

  source_ranges = [ "${chomp(data.http.own-ip.body)}/32" ]
}

resource "google_compute_firewall" "permit-subnetwork-traffic" {
  name = "${var.environment-prefix}-permit-subnetwork-traffic"
  network = "${data.terraform_remote_state.network.network_name}"
  source_ranges = [ "${data.terraform_remote_state.network.subnetwork_ipv4_cidr}" ]

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