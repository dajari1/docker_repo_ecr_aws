# docker_repo_ecr_aws
this is a dockerhub project application that builds docker images and pushes it to AWS ECR repo using Jenkins pipeline
# Project Preriquisite
AWS free tier account
IAM role with an Administrator access
Terraform installed and running locally on the machine

# Project workflow
Create a project in Github, clone it and take to root directory in VScode
CD to the project
Create another folder in the Project directory and name it "infra"
Inside the infra folder, create the terraform files
Go back one step to the main project and create the project files (Jenkinsfile, dockerfile, main.py, command.md)
Input all necessary scripts in all the files

# Installing Jenkins with Terraform
CD into the infra folder in the project directory
Create all necessary files in the "infra" folder (backend.tf, jenkins-1.sh, jenkins-server.tf, outputs.tf, provider.tf, terraform.tfvars, variable.tf, vpc.tf)
Input all necessary scripts in the files created in the "infra" folder
While in the "infra directory" run the following command
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
Now go to AWS console using EC2 connect to confirm if Jenkins has been installed
# To check the status of Jenkins
Run this command
sudo systemctl status jenkins

# To check for docker
Go to the EC2 connect CLI 
Type = docker --version
sudo apt install dock.io
sudo chmod 777 /var/run/docker.sock

# Push the code to Github using the Github commands
git status
git add .
git commit -m "comment"
git push

# Configure Jenkins
Go to Manage Jenkins
Click on available pluggins
Install Docker, docker pipeline, Amazon ECR
Go to Jenkins dashboard
Create project name
Click on Github project
Add the project URL on Github 
https://github.com/dajari1/docker_repo_ecr_aws.git
Choose pipeline script from SCM
Check branch to make sure it is Master or Main
Apply and Save
Click on build now

# Errors and Challenges encountered
AWS not found or AWS configure
# Solution:
 Create an IAM role, give it an Administrative access 
 Modify the IAM role on the Jenkins server EC2 instance
 Highlight the EC2 instance created, click on Action, security, and modify IAM role

 # Second error
 Docker not found
 # Solution:
 Install docker
 Go to the EC2 connect CLI 
Type = docker --version
sudo apt install dock.io
sudo chmod 777 /var/run/docker.sock

Click on "build now" in jenkins
Go to AWS ECR to check if the image has been sent to ECR

# Destroy resources
CD to the infra folder in the project directory and run the terraform command to destroy resources created in AWS
terraform destroy --auto-approve

# Edit AWS account ID in the pipeline
Push codes to github
