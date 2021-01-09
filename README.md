# terrafrom_elb
#first setup your provider and run below command
terraform init
#define your variables in variables.tf
terraform validate
terraform apply
#define your vpc network in vpc.yf
terraform validate
terraform apply
#define your security group in security-groups.tf
terraform validate
terraform apply
#write the init script for building the webservers in install_httpd.sh
#define your desired instance in instances.tf
terraform validate
terraform plan
terraform apply
#Now your instances have been successfully build
#Now define the rules to build the elb in elb.tf
#Modify the instances rule with the instance id we receievd earlier 
terraform plan
terraform apply
