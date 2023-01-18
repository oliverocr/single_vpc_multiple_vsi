#---------------------------------------------------------
# Use existing sshkey
#---------------------------------------------------------
data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}

#data "ibm_is_image" "image" {
#  name = var.select_image_name
#}


#---------------------------------------------------------
# Create instances in each subnet in zone
#---------------------------------------------------------

resource "ibm_is_instance" "instance" {
  count   = var.server-count
  name    = "${var.server-name}-vsi${(count.index) + 1}"
  image   = data.ibm_is_image.select_image.id
  profile = var.profile-server
  resource_group      = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet = ibm_is_subnet.server-subnet-zone1.id
    security_groups = [ibm_is_security_group.server-securitygroup.id]
  }

  vpc = ibm_is_vpc.vpc1.id
  zone = var.zone1
  keys = [data.ibm_is_ssh_key.ssh_key.id]
  timeouts {
	create = "30m"
	update = "30m"
	delete = "30m"
  }
}
