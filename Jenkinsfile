def gv

pipeline {

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
		}

		stage("build jar") {
			steps {
				script {
					gv.buildApp()
				}
			}
		}

		stage("docker image") {
			steps {
				script {
					gv.imageApp()
				}
			}
		}

		stage("docker push") {
			steps {
				script {
					gv.pushApp()
				}
			}
		}	

	}

}