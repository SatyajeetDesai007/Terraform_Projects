resource "aws_instance" "example" {
  ami           = "${var.instance-ami}"
  instance_type = "${var.instance-type}"
  

  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }

  tags = {
    Name = "tf-example"
  }
}