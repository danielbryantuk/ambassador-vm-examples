resource "google_container_cluster" "primary" {
  name               = "ambassador-demo"
  initial_node_count = 3

  # Setting an empty username and password explicitly disables basic auth
  master_auth {
    username = "daniel"
    password = "wibblewibblewibble"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    preemptible = true
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
