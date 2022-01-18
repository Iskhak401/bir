provider "aws" {
    region = "us-east-1"
}


module "awsinstance" {
    source = "./modules"
    ami2 = "ami-083602cee93914c0c"
    ins_type2 = "t2.micro"
    ami = "ami-08e4e35cccc6189f4"
    ins_type = "t3.micro"
    port = ["80", "443"]
    route_table_name = "private"
}


