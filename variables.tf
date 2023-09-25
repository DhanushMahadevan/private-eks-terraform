
# Control Plane Parameters
variable "ami" {
  default = "ami-038937b3d6616035f"
}
variable "key_name" {
  default = "TESTKEY"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "Control Plane"
}

# Worker Node

variable "node_group_name" {
  default = "redis-node-group"
}


