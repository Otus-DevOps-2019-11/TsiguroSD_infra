variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west1-b"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key for provisioners"
}
variable disk_image {
  description = "Disk image"
}
variable gce_ssh_user1 {
}
variable gce_ssh_user2 {
}
variable gce_ssh_user3 {
}
variable count_app {
  default = "1"
}
variable name_app {
  default = "reddit-app"
}

variable health_check_port {
  description = "Port for healthcheck backend service."
}

variable instance_group_name_port {
  default = "http"
}

variable instance_group_port {
  default = "9292"
}

variable forwarding_rule_port_range {
  default = "80"
}

variable hc_check_interval_sec {
  default = "1"
}

variable hc_timeout_sec {
  default = "1"
}
