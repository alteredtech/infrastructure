# --- proxmox-root/database/variables.tf
variable "count_in" {
  description = "how many database servers to create"
}
variable "db_name_in" {
  description = "name of the database server"
}
variable "target_node_in" {
  description = "target proxmox node to deploy vm"
}

variable "clone_in" {
  description = "template to clone from on proxmox"
}
variable "memory_in" {
  description = "maximum memory for the VM"
}
variable "ballon_in" {
  description = "minimum memory for the VM"
}
variable "os_type_in" {
  description = "What type of os, either ubuntu, centos, cloudinit"
}
variable "cores_in" {
  description = "how many cores does the vm get"
}
variable "sockets_in" {
  description = "how many sockets for the vm"
}
variable "size_in" {
  description = "size of disk space for the vm"
}
variable "storage_in" {
  description = "location where the disk will store its information"
}
variable "model_in" {
  description = "model of the networking interface"
}
variable "bridge_in" {
  description = "which internal bridge to use for networking"
}
variable "ipconfig0_in" {
  description = "ip of vm and gateway"
}
variable "nameserver_in" {
  description = "the dns server for the VM to use"
}
variable "searchdomain_in" {
  description = "the dns search domain for the VM"
}