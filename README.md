# SimpliLearn_DevOps_Proj3
Automating Infrastructure using Terraform. 
Tasks
1. Launch an EC2 instance using Terraform 
#1 Clone This repo 
#2 initialize terraform using command : $ terraform init
#3 Run plan : $ terraform plan
#4 run apply : $ terraform apply
#5 now check whether instance is created in AWS.
2. Connect to the instance  
#1 connect to newly increate instance using SSH.
3.Install Jenkins, Java, and Python in the instance
#1 Clone this repo
#2 Run ansible playbook : $ ansible-playbook install_jenkins_java_python.yaml 
#3 Verify whehter Jenkins installed or not by running: http://localhost:8080 in browser.
#4 Verify whether java installed or not by running: $ java --version
#5 Verify whether Python installed or not by running: $ python --version 
