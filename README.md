# Introduction
The following repository represents a full CI/CD pipeline along with technologies such as Github Actions, Jenkins, Docker, Jenkinsfile, Groovy, Terraform (using AWS).
# Pre-requisites
1. To have an account or free tier profile on DigitalOcean which allows to create a droplet for the deployment Jenkins.
2. Simple Java based application (it can be found here in the root folder of the repository).
3. Pre-defined "Jenkins-shared-library" for automating the pipeline.
4. AWS account in order to prepare a simple infrastructure.
# Configuration
1. Firstly, when a droplet on DigitalOcean is ready it must be installed with Jenkins along with Docker permissions:
![1  Installing Jenkins on DigitalOcean](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/74496579-4da3-4f9a-8d7d-94fd3b322288)
2. 
