
resource "aws_instance" "pixar_server" {
  ami = "ami-02003f9f0fde924ea"
  instance_type = "t3.small"
  key_name = aws_key_pair.my_aws_key.id
  vpc_security_group_ids = [aws_security_group.pixar_all_access_sg.id]
  user_data = <<-EOF
    #!/bin/bash 

    cd /tmp
    sudo apt-get update
    sudo apt -y install unzip
    sudo apt -y install python3-pip
    echo "apt install done."

    export PATH=$PATH:~/.local/bin
    export KETAWIN11_SQLSERVER_DBT_PASSWORD=${var.KETAWIN11_SQLSERVER_DBT_PASSWORD}

    # Download source from GitHub
    wget https://github.com/ketabruce/pixar/archive/refs/heads/main.zip
    echo "wget done."

    # Unzip source code
    unzip main.zip
    echo "unzip done"

    # Change to code directory
    cd pixar-main
    sh ./pixar_install.sh
  EOF
}

resource "aws_security_group" "pixar_all_access_sg" {
  name = "pixar_all_access_sg"
  ingress {
    from_port = 0
    to_port   = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_aws_key" {
  public_key = file("/home/bruce/.ssh/my_aws_key.pub")
}

variable "KETAWIN11_SQLSERVER_DBT_PASSWORD" {
   type = string
}

output "Dagster_URL" {
  value = join("", ["http://", aws_instance.pixar_server.public_ip, ":3000/"])
}
