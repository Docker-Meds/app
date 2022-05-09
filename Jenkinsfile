pipeline {
    agent { label 'amazon' }
    environment {
    imagename = "dockermeds/fastapi"
    registryCredential = 'kevalnagda'
    dockerImage = ''
    PROJECT_URL = 'https://github.com/Docker-Meds/app'
    GIT_URL = 'https://github.com/Docker-Meds/app.git'
    BRANCH = 'Master'
  }

  options {
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  stages {
    stage('Cloning Git') {
      steps {
        git branch: "${BRANCH}", url: "${GIT_URL}", credentialsId: 'github_key'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
  }
            post {
        cleanup {
            cleanWs()
        }
    }
}