#!/bin/env groovy

pipeline {
  agent none
   tools { 
        maven 'Maven 3.5.0' 
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
