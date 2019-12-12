
node {
    def app
    def remote = [:]
    remote.name = 'ansible-node'
    remote.host = '40.117.236.133'
    remote.user = 'azureuser'
    remote.password = 'password123'
    remote.allowAnyHosts = true

    stage('Clone repository') {
        checkout scm
    }
    
    stage('ssh command') {
      sshCommand remote: remote, sudo: true, command: 'ls'
    }
}


