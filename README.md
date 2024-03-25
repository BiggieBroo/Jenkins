![image](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/9ebb95da-547d-4829-b38d-ad7a12498f9f)# Introduction
The following repository represents a full CI/CD pipeline along with technologies such as Github Actions, Jenkins, Docker, Jenkinsfile, Groovy, Terraform (using AWS).
# Pre-requisites
1. To have an account or free tier profile on DigitalOcean which allows to create a droplet for the deployment Jenkins.
2. Simple Java based application (it can be found here in the root folder of the repository).
3. Pre-defined "Jenkins-shared-library" for automating the pipeline.
4. AWS account in order to prepare a simple infrastructure.
5. A simple AWS server based on pre-ready template of Terraform which can be used with the repository "Terraform_AWS_Terraform" in the current profile.
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
![Screenshot from 2024-03-25 04-50-27](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/d646093f-0b7d-4959-ba85-132b9ac16c6c)
5. In the 5th step it allows us to create a simple pipeline from the "New Item" category. Note: During the putting the reference of the github url, there should be Jenkinsfile in the root folder:
![Screenshot from 2024-03-25 04-52-16](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/bfb7c1dc-31fc-4316-a437-d27300b9f848)
6. In the "jenkins-shared-library" can be found files that ease the routine of the work by automating the tasks, such as vars/ folder that defines the variables based on the src/com/example folder's classes:
![Screenshot from 2024-03-25 04-56-27](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/90b2876a-88ee-4f57-8654-c182a28ca131)
![Screenshot from 2024-03-24 21-06-27](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/cf51d499-4e98-414a-9434-fab9f2935c83)
7. Before going forward a AWS server should be prepared based on the repository "Terraform_AWS_Server" it can be found by the following link https://github.com/BiggieBroo/Terraform_AWS_Server
8. As soon as the infrastructure gets ready there must be a plugin on Jenkins by the name "SSH Agent". Then should enter .pem file's secret key into the credentials part so that Jenkins might be connected to the AWS server:
![Screenshot from 2024-03-24 13-32-14](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/ba9aac4b-27c5-4512-82f9-b8493d6696b2)
![Screenshot from 2024-03-24 13-38-58](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/768f87da-9709-4617-acc5-40cc8e2cc2a2)
9. The next step is building the pipeline which should success (on DockerHub should appear an artifact with built Docker image, message on Jenkins that Deploy is success, then an uploaded file (script.sh with nginx docker image) on EC2 server can be run as well):
![image](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/f2a8790d-16ab-4fef-8adc-d9e05bb6951d)
![image](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/7a24834c-f7be-4743-9e62-e41c71c42256)
![image](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/dcec9996-b447-4147-a705-d1434afe3a94)
![Screenshot from 2024-03-24 21-53-51](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/bee42127-efc4-4f17-ae6f-e8e84d2c7902)
![Screenshot from 2024-03-24 21-54-15](https://github.com/BiggieBroo/CICD_Pipeline_Jenkins/assets/140602458/fc24b06e-c553-494e-97e1-b8c4bc439dd3)












