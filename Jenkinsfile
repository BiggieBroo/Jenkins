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
						sh "docker login -u ${USER} -p ${PASS}"
						sh "docker push biggiebroo/practice:1.2"
					}
				}
			}
		} // end docker

		stage("build") {
			steps {
				script {
					echo "The application has been built ..."
				}
			}
		}

	} // end stages
}