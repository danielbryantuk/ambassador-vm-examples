
resource "google_compute_http_health_check" "default" {
  name                = "tf-www-basic-check"
  request_path        = "/"
  port                = "80"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 10
  timeout_sec         = 1
}

resource "google_compute_target_pool" "default" {
  name          = "tf-www-target-pool"
  instances     = ["${google_compute_instance.vm_shopfront.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_forwarding_rule" "default" {
  name       = "tf-www-forwarding-rule"
  target     = "${google_compute_target_pool.default.self_link}"
  port_range = "80"
}

resource "google_compute_firewall" "default" {
  name    = "tf-www-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8020", "8030"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["www"]
}

resource "google_compute_http_health_check" "productcatalogue" {
  name                = "tf-productcatalogue-check"
  request_path        = "/products"
  port                = "8020"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 10
  timeout_sec         = 1
}

resource "google_compute_target_pool" "productcatalogue" {
  name          = "tf-productcatalogue-pool"
  instances     = ["${google_compute_instance.vm_productcatalogue.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.productcatalogue.name}"]
}

resource "google_compute_forwarding_rule" "productcatalogue" {
  name       = "tf-productcatalogue-forwarding-rule"
  target     = "${google_compute_target_pool.productcatalogue.self_link}"
  port_range = "8020"
}

resource "google_compute_http_health_check" "stockmanager" {
  name                = "tf-stockmanager-basic-check"
  request_path        = "/stocks"
  port                = "8030"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 10
  timeout_sec         = 1
}

resource "google_compute_target_pool" "stockmanager" {
  name          = "tf-stockmanager-target-pool"
  instances     = ["${google_compute_instance.vm_stockmanager.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.stockmanager.name}"]
}

resource "google_compute_forwarding_rule" "stockmanager" {
  name       = "tf-stockmanager-forwarding-rule"
  target     = "${google_compute_target_pool.stockmanager.self_link}"
  port_range = "8030"
}
