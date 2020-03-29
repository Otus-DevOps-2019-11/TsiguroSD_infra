resource "google_compute_instance" "app" {
  name =var.vm_app_name
  machine_type = "g1-small"
  zone = var.zone
  tags = ["reddit-app"]
  boot_disk {
    initialize_params { image = var.app_disk_image }
 }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "null_resource" "install_app" {
  count = var.provision_enabled ? 1 : 0
  connection {
    type  = "ssh"
    host  = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }
  provisioner "remote-exec" {
    inline = [
  "sudo bash -c 'sudo echo DATABASE_URL=${var.db_ip} >> /etc/environment'"
 ]
  }
  provisioner "file" {
    source      = "../modules/app/files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "../modules/app/files/deploy.sh"
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = var.source_ranges_puma
  target_tags = ["reddit-app"]
}

resource "google_compute_firewall" "firewall_puma_http" {
  name = "allow-puma-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  source_ranges = var.source_ranges_puma
  target_tags = ["reddit-app"]
}
