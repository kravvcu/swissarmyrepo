variable "zone" { default = "europe-west2-a" }

variable "master_name" { default = "k8s-master" }

variable "master_boot_disk_size"  { default = "100" }
variable "master_boot_disk_type"  { default = "pd-standard" }
variable "master_boot_disk_image" { default = "ubuntu-os-cloud/ubuntu-1604-lts" }

variable "master_machine_type" { default = "n1-standard-1" }

variable "network" { default = "default"  }