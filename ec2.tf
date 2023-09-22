resource "aws_key_pair" "forproject" {
  key_name   = "for project"
  public_key = file("~/.ssh/id_rsa.pub")
}
  
  resource "aws_instance""instance1" {
  ami                         = "ami-03a6eaae9938c858c"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.forproject.key_name
  vpc_security_group_ids      = [aws_security_group.secgroups.id]
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance1 in public subnet1"
}
} 

resource "aws_instance" "instance2" {
  ami                         = "ami-03a6eaae9938c858c"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.forproject.key_name
  vpc_security_group_ids      = [aws_security_group.secgroups.id]
  subnet_id                   = aws_subnet.public2.id
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance2 in public subnet2"
}
} 

resource "aws_instance" "instance3" {
  ami                         = "ami-03a6eaae9938c858c"
  instance_type               = "t2.medium"
  key_name                    = aws_key_pair.forproject.key_name
  vpc_security_group_ids      = [aws_security_group.secgroups.id]
  subnet_id                   = aws_subnet.public3.id
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance3 in public subnet3"
}
} 