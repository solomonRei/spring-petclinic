pipeline {
  environment {
    registry = "smeloved/pet-clinic"
    registryCredential = 'dockerhub'
    dockerImage = ''
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
            // dockerImage = docker.build registry + ":${TAG}"
            sh "docker build -t petclinic:${TAG} ."
            // sh "docker container ls --all --quiet --filter 'name=petclinic'"
            // sh "mvn spring-boot:build-image"
        }
      }
    }
   stage('Deploy Image') {
      steps{
         script {
            echo 'Doploying Image'
            // docker.withRegistry( '', registryCredential ) {
            // dockerImage.push()
          
             
        //  }
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
