#cidr for VPC
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

#cidr for 1SUBNETPUBLIC
variable "subnetpublic1_cidr" {
    default = "10.0.101.0/24"
}
#cidr for 2SUBNETPUBLIC
variable "subnetpublic2_cidr" {
    default = "10.0.102.0/24"

}

#cidr for 3SUBNETPUBLIC
variable "subnetpublic3_cidr" {
    default = "10.0.103.0/24"
}
#cidr for 1SUBNETPRIVATE
variable "subnetprivate1_cidr" {
    default = "10.0.1.0/24"
}
#cidr for 2SUBNETPRIVATE
variable "subnetprivate2_cidr" {
    default = "10.0.2.0/24"
}
#cidr for 3SUBNETPRIVATE
variable "subnetprivate3_cidr" {
    default = "10.0.3.0/24"
}