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