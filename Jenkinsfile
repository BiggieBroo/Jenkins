def gv

pipeline {

	agent any

	tools {
		maven "Maven"
	}

	stages {

		stage("init") {
			steps {
				script {
					gv = load "script.groovy"
				}
			}
		} // end init

		stage("build jar") {
			steps {
				script {
					sh "mvn package"
				}
			}
		} // end build

		stage("docker") {
			steps {
				script {
					withCredentials([
					usernamePassword(credentialsId : 'docker', usernameVariable : 'USER', passwordVariable : 'PASS')
					]) {
						echo "${USER} and ${PASS}"
					}
				}
			}
		} // end docker

	} // end stages
}