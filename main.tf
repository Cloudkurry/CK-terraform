provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "mgr_vm01" {
    count = 3
    ami = "ami-0182f373e66f89c85"
    key_name = "key1"
    instance_type = "c4.large"
    vpc_security_group_ids = [ "sg-0ca5f9c84f6c6be92"] # opened port 22 & 2237
    #instance_market_options {
    #  market_type = "spot"
    #}
    associate_public_ip_address = true 
    user_data = file("pre_swarn.sh")
    tags = {
        "Name" = "mgr-vm-${count.index}"
    }
}
