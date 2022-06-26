# AWS with Terraform   
## Folders
* [ec2](/01_ec2)
* [s3](/02_s3)  
* [03_lambda](/03_lambda) Python without dependencies  
* [04_lambda](/04_lambda) Python with dependencies  

## Resources
* Terraform Course - Automate your AWS cloud infrastructure  
https://www.youtube.com/watch?v=SLB_c_ayRMo   

* Terraform - Create Resources on AWS  
https://www.youtube.com/watch?v=BZ2BP2l_lE4

* How do I deploy AWS Lambda using Terraform?  
https://www.youtube.com/watch?v=JSR7U700h0U   
* Terraform Deploy Lambda Function | Terraform IAM Role | AWS Terraform | Terraform Lambda Tutorial  
https://www.youtube.com/watch?v=Lkm3v7UDlD8

### AWS  
* AWS Lambda Deployment Package in Python (zip)  
https://www.youtube.com/watch?v=rDbxCeTzw_k

* Hard Lessons From Deploying Lambda Functions With Terraform  
https://medium.com/rockedscience/hard-lessons-from-deploying-lambda-functions-with-terraform-4b4f98b8fc39  

* Building Lambda with terraform  
https://aws-blog.com/2019/05/building-lambda-with-terraform.html

## Commands
```shell
terraform init
terraform plan
terraform apply
terraform destroy
```
or
```shell
terraform apply -auto-approve
terraform destroy -auto-approve
```
## Export env variables - Linux
```shell
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""
```
