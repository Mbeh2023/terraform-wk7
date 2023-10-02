

## Ec2 instance 

resource "aws_instance" "classkey" {
    ami = "ami-0bb4c991fa89d4b9b"
    vpc_security_group_ids = [aws_security_group.sg-demo.id]
    instance_type = "t2.micro"
    key_name = "classkey"
    subnet_id = aws_subnet.public_subnet1.id
    user_data = file("install.sh")
    tags={
        Name = "Terraform instance"
        env = "Dev"
    }

}
