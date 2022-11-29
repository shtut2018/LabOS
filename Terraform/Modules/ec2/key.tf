resource "aws_key_pair" "pythonapp_key" {
  key_name   = "pythonapp_key"
  public_key = file("/home/danza/.ssh/pythonapp.pub")
}