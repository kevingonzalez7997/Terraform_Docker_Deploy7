#####################################################################
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}
##################################### EC2 #################################################
resource "aws_instance" "jenkins_manager" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a" # Specify the desired availability zone
  vpc_security_group_ids =  ["sg-03f45d050a337ec84"]
  key_name = "Deploy7key"
  user_data = "${file("jenkins_install.sh")}"
  tags = {
    Name = "jenkins_manager"
  }

}

resource "aws_instance" "docker" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a" # Specify the desired availability zone
  vpc_security_group_ids =  ["sg-03f45d050a337ec84"]
  key_name = "Deploy7key"
  user_data = "${file("docker.sh")}"
  tags = {
    Name = "docker"
  }

}

resource "aws_instance" "jenkins_agent" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a" # Specify the desired availability zone
  vpc_security_group_ids = ["sg-03f45d050a337ec84"]
  key_name = "Deploy7key"
  user_data = "${file("terraform.sh")}"
  tags = {
    Name = "jenkins_agent"
  }

}
