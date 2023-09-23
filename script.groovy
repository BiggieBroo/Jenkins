def buildApp() {
	sh "mvn package"
}

def dockerApp() {
  
  withCredentials([usernamePassword(credentialsId : 'docker', usernameVariable : 'USER', passwordVariable : 'PASS')]) {

  sh "docker login -u ${USER} -p ${PASS}"
  sh "docker build -t biggiebroo/practice:jvm-1.4 ."
  sh "docker push biggiebroo/practice:1.4"

  }

}

def dockerBuild() {
	echo "The image has been uploaded on the system"
}

return this