#!/usr/bin/env groovy

library identifier : "jenkins-shared-library@master", retriever : modernSCM([
		$class : "GitSCMSource",
		remote : "https://github.com/BiggieBroo/jenkins-shared-library",
		credentialsId : "github",
	])

pipeline {

 agent any

 // tools
 tools {
 	maven "Maven"
 }

 // environment
 environment {
 	IMAGE_NAME="biggiebroo/practice:jvm-1.0"
 }

 stages {

 	stage("build jar") {
 		steps {
 			script {
 				buildJar()
 			}
 		}
 	} // end build jar

 	stage("docker login, build and push") {
 		steps {
 			script {
 				dockerLogin()
 				buildDockerImage("${IMAGE_NAME}")
 				dockerPush("${IMAGE_NAME}")
 			}
 		}
 	} // end docker login, build and push

 	stage("deploy or run an instance on AWS") {
 		steps {
 			script {
 				def dockerCMD = "bash ./setup.sh ${IMAGE_NAME}"
 				def ec2Instance = "ec2-user@35.156.71.149"
 				sshagent(['ec2-server-key']) {
 					// block inside of the agent
 					sh "scp setup.sh ${ec2Instance}:/home/ec2-user"
 					sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
 					sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${dockerCMD}"
 				}
 			}
 		}
 	}


 } // end stages

} // end pipeline