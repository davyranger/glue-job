provider "aws" {
  region     = "ap-southeast-2"
  access_key = "AKIA3T4R6BA6IXH7N24Q"
  secret_key = "ava3qxVoyQZLi1+XnmJJx2hK7Y/S2rYEleGX7Lut"
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-05c029a4b57edda9e"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform EC2"
  }
}

resource "aws_glue_job" "glue_job" {
  count    = var.create ? length(var.tablenames) : 0

  name     = "${var.name}-strain-${var.asset[count.index]}-${var.tablenames[count.index]}"
  
  role_arn = var.role_arn

  glue_version = var.glue_version[count.index]

  worker_type = var.worker_type[count.index]

  max_capacity = var.max_capacity[count.index]

  number_of_workers = var.number_of_workers[count.index]


  command {
    script_location = "s3://davygluetestbucket/davygluejob/"
  }
}

