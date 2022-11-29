resource "random_shuffle" "subnets" { 
  input = var.subnets
  result_count = 1
} 

resource "aws_instance" "cloudcasts_web" {
  ami           = var.instance_ami
  instance_type = var.instance_size
  subnet_id = random_shuffle.subnets.result[0]
  vpc_security_group_ids = var.security_groups
  key_name = "pythonapp_key"
#   iam_instance_profile = aws_iam_instance_profile.iam_role_for_ec2.name


 
  root_block_device {
    volume_size = var.instace_root_size
    volume_type = "gp3"
  }

  lifecycle {
    create_before_destroy = true
  }
 
  tags = {
    name        = "Dan.Zaltsman"
  }

  user_data = "${file("./intro.sh")}"

}
 
resource "aws_eip" "cloudcasts_addr" {
  vpc      = true
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    name        = "Dan.Zaltsman"
  }
}
 
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.cloudcasts_web.id
  allocation_id = aws_eip.cloudcasts_addr.id
}



