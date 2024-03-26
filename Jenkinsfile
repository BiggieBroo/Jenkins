library identifier: 'CICD_Pipeline_Jenkins@jenkins-shared-library', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/CICD_Pipeline_Jenkins', credentialsId: 'github'])

pipeline {
	agent any
	// Tools
	tools {
		maven "Maven"
	}
	// Environment
	environment {
		IMAGE_TITLE = "biggiebroo/practice:jvm-1.0"
	}

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Docker Login, Build and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_TITLE}")
					dockerPush("${IMAGE_TITLE}")
				}
			}
		} // end Docker Login, Build and Push

		stage("Provision Server") {
			environment {
				AWS_ACCESS_KEY_ID = credentials("aws_access_key_id")
				AWS_SECRET_ACCESS_KEY = credentials("aws_secret_access_key")
				TF_VAR_env = "test"
			}
			steps {
				script {
					dir("Terraform") {
						sh "terraform init"
						sh "terraform -auto-approve"
						EC2_PUBLIC_IP = sh(
							script: "terraform output ec2_public_ip",
							returnStdout: true
						).trim()	
					}
					
				}
			}
		} // end Provision Server

		stage("Deploy") {
			steps {
				script {
					sh "echo 'Lets wait for a while'"
					sleep(time: 90, unit: "SECONDS")
					/*def ec2user = "ec2-user@13.39.158.207"
					def cmdFile = "script.sh"
					sshagent(['aws-server']) {
						sh "ssh -o StrictHostKeyChecking=no ${ec2user}"
						sh "scp ${cmdFile} ${ec2user}:/home/ec2-user"
					
					}*/
				}	
			}
		} // end Deploy


	} // end stages

} // end pipeline