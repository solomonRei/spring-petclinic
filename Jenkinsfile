#!/bin/env groovy

pipeline {
  agent none
   tools { 
        maven 'maven' 
        jdk 'jdk8' 
    }
  stages {
    stage('Build') {
      agent {
        any {
          image 'maven:3.5.0'
        }
      }
      steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
          sh 'mvn clean install -B'
      }
    }
    stage('Build container') {
      agent any
      steps {
        script {
            pom = readMavenPom file: 'pom.xml'
            TAG = pom.version
            sh "docker build -t petclinic:${TAG} ."
        }
      }
    }
  }
}
