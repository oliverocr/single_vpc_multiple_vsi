terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
  required_version = ">= 0.12"
}
provider "ibm" {
  ibmcloud_api_key        = var.ibmcloud_api_key
  region                  = var.ibmcloud_region
}
