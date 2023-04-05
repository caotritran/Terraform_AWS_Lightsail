# Provide a static IP address to the Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  instance_name = aws_lightsail_instance.instance.name
  static_ip_name = var.static_ip_attachment
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = var.static_ip
}

# import Lightsail SSH Key Pair
resource "aws_lightsail_key_pair" "lg_key_pair" {
  name       = "importing"
  public_key = file("./id_rsa.pub")
}

# Create a new Wordpress Lightsail Instance
resource "aws_lightsail_instance" "instance" {
  name = var.instance
  availability_zone = var.instance_availability_zone
  blueprint_id = var.instance_blueprintid
  bundle_id = var.instance_bundleid
  #key_pair_name = var.intance_key_pair
  key_pair_name = aws_lightsail_key_pair.lg_key_pair
  tags = {
    Environment = "TDA"
  }
}

resource "aws_lightsail_instance_public_ports" "instance" {
  instance_name = aws_lightsail_instance.instance.name

  port_info {
    protocol  = "tcp"
    from_port = 20
    to_port   = 22
  }
  port_info {
    protocol  = "tcp"
    from_port = 10050
    to_port   = 10050
    cidrs = ["103.97.124.136/32"]
  }
  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
  port_info {
    protocol  = "tcp"
    from_port = 30000
    to_port   = 50000
  }
}



