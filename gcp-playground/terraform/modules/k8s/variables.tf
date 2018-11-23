variable "zone" { default = "europe-west2-a" }

variable "master_name_prefix" { default = "k8s-master" }
variable "master_boot_disk_size"  { default = "100" }
variable "master_boot_disk_type"  { default = "pd-standard" }
variable "master_boot_disk_image" { default = "ubuntu-os-cloud/ubuntu-1804-lts" }
variable "master_machine_type" { default = "n1-standard-1" }

variable "slave_name_prefix" { default = "k8s-slave" }
variable "slave_boot_disk_size"  { default = "100" }
variable "slave_boot_disk_type"  { default = "pd-standard" }
variable "slave_boot_disk_image" { default = "ubuntu-os-cloud/ubuntu-1804-lts" }
variable "slave_machine_type" { default = "n1-standard-1" }

variable "subnetwork" { default = "default" }

variable "no_k8s_masters" { default = "1" }
variable "no_k8s_slaves" { default = "1" }
