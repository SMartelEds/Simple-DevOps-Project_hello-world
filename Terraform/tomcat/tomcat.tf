variable "serverstraffic_sg-name" {
  type = string
}

resource "aws_instance" "tomcat-ec2" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    security_groups = [var.serverstraffic_sg-name]
    user_data = file("./tomcat/tomcat-script.sh")
    key_name= "manuk_virgi" # clé créée manuellement sur aws.com

    tags = {
      Name = "Tomcat"
    }
  }

output "tomcat-ip" {
  value = aws_instance.tomcat-ec2.public_ip
}
