pipeline {
    agent { label 'amazon' }
    environment {
    image_name = "dockermeds/fastapi"
    registryCredential = 'docker_hub_login'
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
          dockerImage = docker.build image_name
        }
      }
    }
    stage('Push Docker Images') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
  
    stage('Remove Docker Image') {
      steps{
        sh "docker rmi $image_name:$BUILD_NUMBER"
         sh "docker rmi $image_name:latest"
      }
    }
  }
            post {
        cleanup {
            cleanWs()
        }
    }
}