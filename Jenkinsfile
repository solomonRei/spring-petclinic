pipeline {
  environment {
    registry = "smeloved/pet-clinic"
    registryCredential = 'dockerhub'
  }
  agent {
    label 'slave'
  }
  stages {
    stage('Compile') {
      steps {
        sh 'mvn compile'
      }
    }
    
    stage('Build') {
      steps {
          sh 'mvn clean install -B'
      }
    }
    
    stage('Build container') {
      steps {
        script {
            pom = readMavenPom file: 'pom.xml'
            TAG = pom.version
            dockerImage = docker.build registry + ":latest"
            sh "docker build -t petclinic:${TAG} ."
//             sh "mvn spring-boot:build-image"
        }
      }
    }
   stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    
  }
  post{
    always{
      cleanWs()
    }
  }
}
