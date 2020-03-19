variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west1-b"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "ruby-base-ans"
}
variable source_ranges_puma {
  description = "Allowed IP adderesses to reddit"
  default = ["0.0.0.0/0"]
}

variable vm_app_name {
  description = "vm name"
  default = "reddit-app"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key for provisioners"
}

variable "db_ip" {
  description = "Reddit DB ip"
}

variable provision_enabled {
  default = "false"
}
