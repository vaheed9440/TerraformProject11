resource "aws_instance" "public_instance" {
  ami                         = "ami-08ee1453725d19cdb"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = "devops"

  tags = {
    Name = "app_server"
  }

  security_groups = [aws_security_group.web_node.id]
  user_data       = file("sample.sh")
}

