#! /bin/bash

#Docker Install
yum update -y

amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

#Docker run


sudo curl https://public-dan-zaltsman.s3.amazonaws.com/PythonCode.zip --output /home/ec2-user/PythonCode.zip

# aws s3 cp s3://danza-proj-bucket-1/python/PythonCode.zip /home/ec2-user/

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version > /home/ec2-user/dockerversion.txt

cd /home/ec2-user/

unzip PythonCode.zip

cd /home/ec2-user/PythonCode

docker-compose up



