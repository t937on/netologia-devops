pipeline {
    agent {
      label 'linux'
    }

    stages {
        stage('checkout role') {
            steps {
                dir('netologia-jenkins') {
                    git branch: 'main', credentialsId: 'f20892b7-5c27-44cb-84b2-420cf08561c8', url: 'git@github.com:t937on/netologia-jenkins.git'
                }
            }
        }
        stage('Install molecule') {
            steps {
                dir('netologia-jenkins') {
                    sh 'pip3 install -r requirements.yml'
                }
                sh 'echo ========'
            }
        }
        stage('Run molecule') {
            steps {
                dir('netologia-jenkins') {
                    sh 'molecule test'
                }
            }
        }
    }
}
