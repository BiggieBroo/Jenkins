#!/bin/bash/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM([
	$class: 'GitSCMSource',
	remote: 'https://github.com/BiggieBroo/jenkins-shared-library',
	credentialsId: 'github',
])

pipeline {

 agent any

 // Tools
 tools {
 	maven "Maven"
 }

 // Environment
 environment {
 	IMAGE_NAME = "biggiebroo/practice:jvm-1.0"
 }

 stages {

 	stage("Build Jar") {
 		steps {
 			script {
 				buildJar()
 			}
 		}
 	} // end Build Jar

 	stage("Docker Login, Building and Push") {
 		steps {
 			script {
 				dockerLogin()
 				buildDockerImage("${IMAGE_NAME}")
 				dockerPush("${IMAGE_NAME}")
 			}
 		}
 	} // end Docker Login, Building and Push

 	stage("Deploy") {
 		steps {
 			script {
 				sshagent(['ec2-server-key']) {
 					sh "scp setup.sh ec2-user@3.79.237.14"
 					sh "ssh ec2-user@3.79.237.14"
 				}
 			}
 		}
 	} // end Deploy

 } // end stages



} // end pipeline
