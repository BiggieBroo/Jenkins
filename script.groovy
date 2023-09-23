def buildApp() {
	sh "mvn package"
}

def dockerApp() {
  
  withCredentials([usernamePassword(credentialsId : 'docker', usernameVariable : 'USER', passwordVariable : 'PASS')]) {

  sh "docker login -u ${USER} -p ${PASS}"

  }

}

def dockerBuild() {
	echo "The image has been uploaded on the system"
}

return this