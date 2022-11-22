variable "serverstraffic_sg-name" {
  type = string
}

# variable "sshk" {
#   type = map
# }

# resource "aws_key_pair" "sshk" {
#   key_name   = "sshkey"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH8wviR0DuVmru5dphIpP1vr+ZMO8D/HB8W3h0ISWqXN+NXlNZQcYaAcr9rO/qTcRvn2CCe4Hjfbjuj2vawF7a1qEFlFRvLDvFaS3S8XuPR2Gxgr3bJtjAZi7OY6GZA8JpVok4HGVPnHhwrzFaVqLwX7Ht7HxlWOSiK192KBNryyXIJz7S7ftq4evcn7+DK2Pm+bfopvIh1xdceEqARi+4RWaDOV4OUHaHhWwxC6RBKzskQ5asIoMLQ/5L9zoiEVu4m/4hNVrg+BDzRjEILv8OYXRb+a/OvC4BMZBPEgoKFEwn9R0Nd6GzTQWs3FlJ9JE/k038YDwHDoVT5Oqy0G+kjcM3RG1hrybgV61cuq0QOKEiu2XtK3CHcLmSAE1HFZXbRE2bHBL/5AE17Wp55M2nUyqFPTQHgP+Zv+/dgAsQ4zAf+k4PsnS6Cr8OJA9jxv+qR1Zb4zhppkH1ffxiVrDzsDJD8V7ofJe2E0ZnrLdiTTPS8tShu+QfBFPCH3PTnOc= devoteam_smartel@FRL3964"
# }

resource "aws_instance" "jkins-ec2" {
    ami = "ami-09a41e26df464c548"
    instance_type = "t2.micro"
    security_groups = [var.serverstraffic_sg-name]
    user_data = file("./cicd/cicd-script.sh")
    # subnet_id = "subnet-04ee7ebdd6ffa5d37"
    key_name= "manuk_virgi" # clé créée manuellement sur aws.com

#   connection {
#       type        = "ssh"
#       host        = self.public_ip
#       user        = "admin"
#       private_key = file(var.sshk["key_path"])
#       timeout     = "4m"
#    }

    tags = {
      Name = "Jenkins"
    }
  }

output "cicd-ip" {
  value = aws_instance.jkins-ec2.public_ip
}
