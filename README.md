How to run - 

Please run terraform apply from s3backend first - It will create s3 bucket and dynamoDB for our terraform state file.

└── s3backend
    ├── main.tf
    ├── terraform.tfstate
    └── terraform.tfstate.backup

After we have s3 backend we can run our module from terraform folder
├── intro.sh
├── main.tf
├── Modules

After a few minuter ec2 instance will be created and the following URL will be accessible on port 80 - for example :

http://34.205.192.144/redis/redis
http://34.205.192.144/elastic/elasticsearch

