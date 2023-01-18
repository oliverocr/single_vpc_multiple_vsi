
## Pre-requisit:
1. [Setup an IBM Cloud Account at](https://cloud.IBM.com/)
2. [define a Ressource Group in IAM](https://cloud.ibm.com/account/resource-groups/) like: resource-vpc-space
3. [define your ssh key for VPC infrastrucre:](https://cloud.ibm.com/vpc/compute/sshKeys/) like: user-ssh. If you use both VPC generations, it is necessary to define it twice.
4. [define an IBM Cloud API key:](https://cloud.ibm.com/iam/apikeys/)
5. [Download and install the Terraform CLI:](https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-getting-started#tf_installation)
6. [Change the information in the file variables.tf. The variables.tf contain the mapping information.]

With the custom-IBM-vpc-Terraform, you can deploy following architecture:
1. One VPC in Frankfurt
2. One Address Prefix in Frankfurt01 data center with *10.28.250.0/24*
3. One SubNet 	*vpc-space-eu-de-1-server*  in Frankfurt or Dallas with *10.28.250.0/24*
4. VSIs in Frankfurt  	*servername-eu-de-1*
5. One Public Gateway

After the infrastructure is deployed you can test it. Logon into the server: ``$ssh core@server-ip``

It is only possible to access the server via SSH. Therefore only port 22 is allowed.
