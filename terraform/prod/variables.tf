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

  description = "Path to the private key for provisioners"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "ruby-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "mongodb-base"
}
