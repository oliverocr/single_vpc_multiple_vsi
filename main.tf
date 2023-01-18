#---------------------------------------------------------
# Get resource_group id
#---------------------------------------------------------

data "ibm_resource_group" "group" {
  name = "${var.resource_group}"
}

#---------------------------------------------------------
# Get VSI image id
#---------------------------------------------------------
data ibm_is_image "select_image" {
  name = var.select_image_name
}

#---------------------------------------------------------
# Create new VPC
#---------------------------------------------------------
resource "ibm_is_vpc" "vpc1" {
  name                = var.vpc-name
  resource_group      = data.ibm_resource_group.group.id
  address_prefix_management = "${var.address-prefix-management}"
}

#---------------------------------------------------------
# Create new address prefixe in VPC Zone
#---------------------------------------------------------
resource "ibm_is_vpc_address_prefix" "prefix-1" {
  name = "zone1-cidr-1"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
  cidr = var.vpc-address-prefix-1
  is_default  = false
  provisioner "local-exec" {
    command = "sleep 100"
    when    = "destroy"
  }
}

#---------------------------------------------------------
# Create Subnet in Zone
# adding public gateway to each subnet in each zone
#---------------------------------------------------------
resource "ibm_is_subnet" "server-subnet-zone1" {
  name            = "${var.vpc-name}-${var.zone1}-server"
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone1
  ipv4_cidr_block = var.server-subnet-zone-1
  public_gateway  = ibm_is_public_gateway.pubgw-zone1.id
  timeouts {
	create = "30m"
	update = "30m"
	delete = "30m"
  }
}
