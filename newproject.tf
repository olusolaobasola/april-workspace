provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}


resource "aws_instance" "new_project" {
  ami                    = "ami-0fbec3e0504ee1970"
  instance_type          = "t2.micro"
  key_name               = "DAY 2 HOMEWORK"
  vpc_security_group_ids = [aws_security_group.newproject_sg.id]

  tags = {
    Name        = "newproject"
    provisioner = "Terraform"
    test        = "yes_no"
  }
}

resource "aws_instance" "jenkins_newproject" {
  ami                    = "ami-0fbec3e0504ee1970"
  instance_type          = "t2.micro"
  key_name               = "DAY 2 HOMEWORK"
  vpc_security_group_ids = [aws_security_group.newproject_sg.id]

  tags = {
    Name        = "jenkins-newproject"
    provisioner = "Terraform"
    test        = "yes"
  }
}

resource "aws_security_group" "newproject_sg" {
  name = "newproject2_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
