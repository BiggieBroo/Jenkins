def gv

pipeline {
	
	agent any

	// tools
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
					gv.buildJar()
				}
			}
		} // end buildjar

		stage("build image") {
			steps {
				script {
					gv.buildImage()
				}
			}
		} // end buildImage


		stage("deploy") {
			input {
				message "Please choose one of the environments"
				ok "Done"
				parameters {
					choice(name : 'ENV', choices : ['Staging', 'Dev', 'Prod'], description : '')
				}
			}
			steps {
				script {
					gv.deploy()
					echo "Chosen environment is ${ENV}"
				}				
			}


		}

	} // end stages

}