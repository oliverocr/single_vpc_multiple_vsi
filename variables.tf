
variable "ibmcloud_timeout" {
  description = "Timeout for API operations in seconds."
  default     = 900
}

#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "ibmcloud_api_key" {}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_key_name" {}

#---------------------------------------------------------
## DEFINE VPC name and available Ressource Group (IAM)
#---------------------------------------------------------
variable "vpc-name" {}

 variable "resource_group" {}

 variable "address-prefix-management" {
  default = "manual"
}

#---------------------------------------------------------
## DEFINE Region and Zones in Frankfurt region eu-de
## To switch regin via CLI:  $ibmcloud target -r eu-de
#---------------------------------------------------------

variable "ibmcloud_region" {
#  description = "Region of VPC like eu-de"
  default = "eu-de"
}
#---------------------------------------------------------
## can use eu-de-1 / eu-de-2 /eu-de-3
#----------------------------------------------------------
variable "zone1" {
#  description = "use  eu-de-1 or eu-de-2 or eu-de-3"
  default = "eu-de-1"
}

#---------------------------------------------------------
## DEFINE CIDR Block for VPC in Regions
#---------------------------------------------------------
variable "vpc-address-prefix-1" {}

#---------------------------------------------------------
## DEFINE subnet for server in each zone
#---------------------------------------------------------
variable "server-subnet-zone-1" {}

#---------------------------------------------------------
## DEFINE OS image to be used for compute instances
## 
## You can generate the full list via CLI   $ibmcloud is images
## 
## "ibm-ubuntu-20-04-2-minimal-amd64-1"
## "ibm-windows-server-2012-r2-full-standard-amd64-6"
## "ibm-centos-7-0-minimal-amd64-1"
## "ibm-centos-8-2-minimal-amd64-2"
## "ibm-debian-9-9-minimal-amd64-2"
#---------------------------------------------------------
variable "select_image_name" {}
#  description = "use  ibm-fedora-coreos-36-testing-2 or select: $ibmcloud is images"
#  description = "use rhcos-x86-64-ibmcloud-adif or select: $ibmcloud is images"
#  default = "rhcos-x86-64-ibmcloud-adif"
#}

#---------------------------------------------------------
## DEFINE compute instance profile & quantity
## You can generate this list via CLI   $ibmcloud is instance-profiles
##
##   "bx2-16x64"
##   "bx2-2x8"
##   "cx2-16x32"
##   "cx2-2x4"
##   "cx2-32x64"
##   "cx2-4x8"
##   "cx2-8x16"
##   "mx2-16x128"
##   "mx2-2x16"
##   "mx2-32x256"
##   "mx2-4x32"
##   
#---------------------------------------------------------
variable "profile-server" {
#  description = "use cx2d-16x32 or select: $ibmcloud is instance-profiles"
  default = "cx2d-16x32"
}

variable "server-name" {}

variable "server-count" {}
}
