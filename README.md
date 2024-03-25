![image](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/9ebb95da-547d-4829-b38d-ad7a12498f9f)# Introduction
The following repository represents a full CI/CD pipeline along with technologies such as Github Actions, Jenkins, Docker, Jenkinsfile, Groovy, Terraform (using AWS).
# Pre-requisites
1. To have an account or free tier profile on DigitalOcean which allows to create a droplet for the deployment Jenkins.
2. Simple Java based application (it can be found here in the root folder of the repository).
3. Pre-defined "Jenkins-shared-library" for automating the pipeline.
4. AWS account in order to prepare a simple infrastructure.
# Configuration
1. Firstly, when a droplet on DigitalOcean is ready it must be installed with Jenkins along with Docker permissions:
![1  Installing Jenkins on DigitalOcean](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/74496579-4da3-4f9a-8d7d-94fd3b322288)
![2  Checking the permission](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/07e14c87-ad61-4524-aefc-709d934125be)
2. Then use the url with the corresponding url, at the initial phase Jenkins requires to input a password which can be found in the docker's jenkins_home/secrets/initialPassword:
![3  Finding the initial password](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/16afc791-c190-49b9-909f-47d43f940106)
3. After the 3rd step a standard installation is done:
![4  Entering the initial password](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/dde10117-49f0-4c3f-8303-31c7f67c966e)
![Screenshot from 2024-03-25 04-46-15](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/81ef3ec4-4f09-458c-9d9d-e92a9664c26e)
![Screenshot from 2024-03-25 04-47-00](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/d857a753-09ce-49d4-8b8f-e24e4f2047a1)
4. The next step is installing Tool "Maven" in the Tools category, after that requires to set up credentials for DockerHub (username and password), Github (secret text) for the further integrations.
![Screenshot from 2024-03-25 04-49-11](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/c4fcbba7-dbe3-4993-a20a-709b3e98dded)





