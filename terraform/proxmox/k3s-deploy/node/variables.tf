# --- proxmox-root/k3s-deploy/node/varaibles.tf
variable "count_in" {
  description = "how many node servers to create"
}
variable "node_name_in" {
  description = "name of the node server"
}
variable "target_node_in" {
  description = "target proxmox node to deploy vm"
}

variable "clone_in" {
  description = "template to clone from on proxmox"
}
variable "memory_in" {
  description = "maximum memory for the VM"
  // validation {
  //   condition     = var.memory_in > 16384
  //   error_message = "The max memory must be less than 16382."
  // }
}
variable "ballon_in" {
  description = "minimum memory for the VM"
  // validation {
  //   condition     = var.ballon_in < 512
  //   error_message = "The minimum memory must be higher than 512."
  // }
}
variable "os_type_in" {
  description = "What type of os, either ubuntu, centos, cloudinit"
}
variable "cores_in" {
  description = "how many cores does the vm get"
}

variable "size_in" {
  description = "size of disk space for the vm"
  validation {
    condition     = var.size_in >= 6
    error_message = "The size of the disk must be 6 or larger."
  }
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
variable "ip_base_in" {
  description = "base ip of vm"
  // validation {
  //     condition = var.node_name_in == "rick" && var.count_in > 10
  //   //   TODO check to see if the terraform state lists what the ip address is of the vm after creation.
  //     error_message = "The ip range for the master nodes conflicks with the base ip of the worker nodes. Please decrease the amount of master nodes or change the ip base for the worker nodes."
  // }
}
variable "gw_in" {
  description = "gateway for the vm"
}
variable "nameserver_in" {
  description = "the dns server for the VM to use"
}
variable "searchdomain_in" {
  description = "the dns search domain for the VM"
}