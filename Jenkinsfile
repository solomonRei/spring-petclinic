pipeline {
  agent {
    label 'slave'
  }
  stages {
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
//             sh "docker build -t petclinic:${TAG} ."
            sh "mvn spring-boot:build-image"
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
