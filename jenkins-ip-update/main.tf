terraform {
  backend "s3" {
    bucket = "terraform-remote-d76"
    key    = "misc/jenkins-ip-updated/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "jenkins"{
    instance_id = "i-073d95a812f8e4d01"
}

resource "aws_route53_record" "jenkins" {
  name = "jenkins"
  type = "A"
  ttl = 10
  zone_id = "Z043769343BOX5323WQF"
  records = [data.aws_instance.jenkins.public_ip]
}

data "aws_instance" "artifactory"{
    instance_id = "i-0a5466629e1b04845"
}

resource "aws_route53_record" "artifactory" {
  name = "artifactory"
  type = "A"
  ttl = 10
  zone_id = "Z043769343BOX5323WQF"
  records = [data.aws_instance.artifactory.public_ip]
}
