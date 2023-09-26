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
 				buildDockerImage("biggiebroo/practice:jvm-1.0")
 				dockerPush("biggiebroo/practice:jvm-1.0")
 			}
 		}
 	} // end docker login, build and push

 	stage("deploy or run an instance on AWS") {
 		steps {
 			script {
 				def dockerCMD = "docker run -d -p 8080:8080 biggiebroo/practice:jvm-1.0"
 				sshagent(['ec2-server-key']) {
 					// block inside of the agent
 					sh "ssh -o StrictHostKeyCheking=no ec2-user@35.156.71.149 ${dockerCMD}"
 				}
 			}
 		}
 	}


 } // end stages

} // end pipeline