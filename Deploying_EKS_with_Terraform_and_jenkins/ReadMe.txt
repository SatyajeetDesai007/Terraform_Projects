prerequisites:
1) Terraform 
2) Kubernetes
3) Aws Account
4) Terraform Installation
5) Access Keys

process :
we are going to deploy Jenkins on EC2 instance. then we create EKS cluster. that Jenkins create pipeline, trigger that and EKS will create.


steps :
1) create an EC2 instance + Jenkins
2) write TF code -> EKS cluster
3) push the code on GitHub
4) create a Jenkins pipeline -> EKS cluster
5) deploy the changes  to Aws
6) implement a deployment file with help of Kubectl
