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

		stage("Deploy") {
			steps {
				script {
					def ec2user = "ec2-user@35.180.199.194"
					def cmdFile = "script.sh"
					sshagent(['aws-server']) {
						sh "ssh -o StrictHostKeyChecking=no ${ec2user}"
						sh "scp ${cmdFile} ${ec2user}:/home/ec2-user"
						sh "ssh -o StrictHostKeyChecking=no ${ec2user} sudo bash ${cmdFile}"
					}
				}
			}
		} // end Deploy


	} // end stages

} // end pipeline