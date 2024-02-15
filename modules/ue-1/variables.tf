variable "ins_type" {
    type = string 
    description = "size of the instance"
}

variable "ami" {
    type = string 
    description = "ami to use on the webserver instance"
}

variable "port" {
    type = list(string)
    description = "ports which you want to allow"
}

variable "route_table_name" {
    type = string
    description = "name of the route-table"
}

variable "ins_type2" {
    type = string 
    description = "size of the instance"
}

variable "ami2" {
    type = string 
    description = "ami to use on the webserver instance"
}