provider "aws" {
  region                  = "us-east-2"
  shared_credentials_file = "/home/alef/terraform_test/.aws/credentials"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


resource "aws_key_pair" "kubernetes-key" {
  key_name   = "kubernetes-key"
  public_key = "${file("/home/alef/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "kubernetes-sg" {

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port   = 0
    protocol  = -1
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "kubernetes-master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = "${aws_key_pair.kubernetes-key.key_name}"
  security_groups = ["${aws_security_group.kubernetes-sg.name}"]
  count         = 1
  tags = {
    name = "kubernetes"
    type = "master"
  }
}

resource "aws_instance" "kubernetes-worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = "${aws_key_pair.kubernetes-key.key_name}"
  security_groups = ["${aws_security_group.kubernetes-sg.name}"]
  count         = 1
  tags = {
    name = "kubernetes"
    type = "worker"
  }
}
