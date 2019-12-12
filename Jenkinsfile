
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
    
    stage('ssh command') {
      sshCommand remote: remote, sudo: true, command: 'pwd'
    }
}


