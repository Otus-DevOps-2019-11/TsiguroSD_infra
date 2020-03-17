output "app_external_ip" {
  value = module.app.app_external_ip
}
#output "app_lb_ip" {
#  value = "${google_compute_global_address.applbaddress.address}"
#}

output "db_external_ip" {
  value = module.db.db_external_ip
}
