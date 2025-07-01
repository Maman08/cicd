provider "aws"{
    region="ap-south-1"
}


resource "aws_security_group" "web_sg"{
    name="web-server-sg"
    description="Allow HTTP  inbound traffic"
    vpc_id="vpc-0ebd80a6ce199cef7"
    ingress{
        description="HTTP"
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

}







resource "aws_instance" "ec2_machine"{
    ami = "ami-007020fd9c84e18c7"
    instance_type="t2.micro"
    count=3
    vpc_security_group_ids=[aws_security_group.web_sg.id]
    tags={
        Name="Terraform - EC2"
    }
    user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              echo "<h1>Hello from Terraform EC2 instance $(hostname)</h1>" > /var/www/html/index.html
              systemctl enable apache2
              systemctl restart apache2
            EOF

}

output "public_ip"{
    value=[for i in aws_instance.ec2_machine: i.public_ip]
}

resource "aws_s3_bucket" "demo_bucket"{
    bucket = "collegeterraformbucket"
    tags={
        Name="Demo-college-teraform-bucket"
    }
}

resource "aws_s3_bucket_object" "text_file"{
    bucket=aws_s3_bucket.demo_bucket.bucket
    key="sample1.txt"
    source="./sample1.txt"
}