node {
    def app
    def remote = [:]
    remote.name = 'ansible-node'
    remote.host = '40.127.162.47'
    remote.user = 'azureuser'
    remote.password = 'Password123'
    remote.allowAnyHosts = true

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("csherr2510/coursework-2")
    }

  stage('SonarQube Test') {
    def scannerHome = tool 'SonarQube';
    withSonarQubeEnv('SonarQube') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=java-jenkins-sonar -Dsonar.sources=."
    }
  }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'csherr-2510') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
	
	stage('ssh command') {
      sshCommand remote: remote, sudo: true, command: 'kubectl create deployment coursework-2 --image=https://hub.docker.com/repository/docker/csherr2510/coursework-2:latest'
      sshCommand remote: remote, sudo: true, command: 'kubectl get deployments'	
    }
}



