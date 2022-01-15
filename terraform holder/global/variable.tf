variable "instance_type" {
  description = "Instance type t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  default = "davytestgluejob"
}

variable "create" {
  default = true
}

variable "role_arn" {
  default = "arn:aws:iam::798633101372:role/dojo-glue-rolejb"
}

variable "max_capacity" {
  default = [null, 2, 2, 2]
}

variable "number_of_workers" {
  default = [2, null, null, null]
}

variable "worker_type" {
  type    = list(string)
  default = ["G.2X", null, "Standard", "Standard"]
}

variable "glue_version" {
  default = ["1.0", "1.0", "1.0", "1.0"]
}

variable "tablenames" {
  type    = list(string)
  default = ["success", "fault", "unavailable", "same"]
}

variable "asset" {
  type    = list(string)
  default = ["rst", "cst", "pst", "dst"]
}
