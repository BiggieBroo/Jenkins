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
					sshagent(['aws-server']) {
						def ec2server = "ec2-user@13.38.24.159"
						def cmdFile = "script.sh"
						sh "scp -i ${cmdFile} ${ec2server}/home/ec2-user"
						sh "ssh -o StrictHostKeyChecking=no ${ec2server}"
					}
				}
			}
		} // end Deploy


	} // end stages

} // end pipeline