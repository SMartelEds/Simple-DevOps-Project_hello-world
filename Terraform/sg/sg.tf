variable "ingressPorts" {
  type = list(number)
  default = [80, 443, 22, 8080]
}

# variable "egressPorts" {
#   type = list(number)
#   default = [80]
# }

resource "aws_security_group" "serverstraffic" {
  name = "Allow ssh and 8080 traffics"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressPorts
    content {
    from_port = port.value
    to_port = port.value 
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.ingressPorts
    content {
    from_port = port.value
    to_port = port.value 
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

}

output "serverstraffic_sg-name" {
    value = aws_security_group.serverstraffic.name
}