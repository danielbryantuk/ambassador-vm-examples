output "shop_loadbalancer_ip" {
  value = "${google_compute_forwarding_rule.shopfront.ip_address}"
}

output "shopfront_ips" {
  value = "${join(" ", google_compute_instance.vm_shopfront.*.network_interface.0.access_config.0.nat_ip)}"
}

output "productcatalogue_ips" {
  value = "${join(" ", google_compute_instance.vm_productcatalogue.*.network_interface.0.access_config.0.nat_ip)}"
}

output "stockmanager_ips" {
  value = "${join(" ", google_compute_instance.vm_stockmanager.*.network_interface.0.access_config.0.nat_ip)}"
}
