resource "aws_instance" "webweaver_ec2" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name = "${aws_key_pair.weaver.key_name}"
  user_data = data.template_file.user_data.rendered
  provisioner "file" {
    source = "var.frontend"
    destination = "/tmp/react"

    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = var.private_key
        host        = self.public_ip
    }
  }

  tags = {
    Name = "webweaver-dev-ec2"
  }
  depends_on = [ aws_key_pair.weaver ]
}


resource "tls_private_key" "RSA" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "weaver" {
  key_name = "weaver"
  public_key = tls_private_key.RSA.public_key_openssh
}

resource "local_file" "weaver" {
  content = tls_private_key.RSA.private_key_openssh
  filename = "weaver.pem"
}


data "template_file" "user_data" {
  template = file("${path.module}/install_nginx.sh")
}


