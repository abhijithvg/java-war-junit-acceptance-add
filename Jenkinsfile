pipeline {
  agent {
    node {
      label 'master'
    }
  }

  parameters {
    string(name: 'JENKINSDIR', defaultValue: '/Users/abhijithvg/Desktop/WorkFolder/Schogini-Training/Demos/CICD-Pipeline/forjenkins/jenkins_home', description: 'The project path in the host machine')
    string(name: 'MVNCACHE', defaultValue: '/Users/abhijithvg/Training/Collabera/DevOpsPlus1/.m2', description: 'Maven repository cache in the host machine')
    string(name: 'DOCKER_U', defaultValue: 'abhijithvg', description: 'Docker Hub Username')
    string(name: 'INPUT1', defaultValue: '10', description: 'Acceptance Test Input 1')
    string(name: 'INPUT2', defaultValue: '5', description: 'Acceptance Test Input 2')
    string(name: 'ADDRESULT', defaultValue: '15', description: 'Acceptance Test Input Add Result')
  }

  stages {

      stage('Clone') {
        steps {
          git url: 'https://github.com/abhijithvg/java-war-junit-acceptance-add.git'
          sh '''sed -i \"s/BUILD_ID/${BUILD_ID}/\" src/main/webapp/index.jsp'''
          sh '''sed -i \"s/BUILD_ID/${BUILD_ID}/\" kubernetes/deploy-svc.yml'''
          sh '''sed -i \"s/BUILD_ID/${BUILD_ID}/\" ansible/docker-image-creation.yml'''
          sh '''sed -i \"s/BUILD_ID/${BUILD_ID}/\" ansible/sample.yml'''

        }
      }

      stage('Unit Tests') {
        steps {
         sh "docker run --net=jenkins --rm -i -v ${params.MVNCACHE}:/root/.m2 -v ${params.JENKINSDIR}/workspace/${JOB_BASE_NAME}:/project -w /project maven:3.6.3-jdk-8-openj9 mvn clean test"
        }
      }

      stage('Build Java App') {
        steps {
          sh "docker run --net=jenkins --rm -i -v ${params.MVNCACHE}:/root/.m2 -v ${params.JENKINSDIR}/workspace/${JOB_BASE_NAME}:/project -w /project maven:3.6.3-jdk-8-openj9 mvn package"
       }
      }

      stage('Docker Image Context') {
        steps {
          sh 'cp -f target/SampleJava.war tomcat/webapp.war'
        }
      }

      stage('Build Docker Image') {
        steps {
          sh "docker build -t ${params.DOCKER_U}/tomcat:pipeline-${BUILD_ID} tomcat"
        }
      }

      stage('Push Docker Image') {
          steps {
              withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                  sh("docker login -u=${DOCKER_USERNAME} -p=${DOCKER_PASSWORD}")
                  sh("docker push ${DOCKER_USERNAME}/tomcat:pipeline-${env.BUILD_ID}")
                  //To remove the image locally
                  //sh('docker rmi ${params.DOCKER_U}/tomcat:pipeline-${env.BUILD_ID}')
              }
          }
      }

      stage('Deploy to Docker Tomcat') {
        steps {
          sh "docker inspect my-tcc2 >/dev/null 2>&1 && docker rm -f my-tcc2 || echo No container to remove. Proceed."
          sh "docker run --net=jenkins -id -p 7081:8080 --name my-tcc2 docker.io/${params.DOCKER_U}/tomcat:pipeline-${BUILD_ID}"
        }
      }

      stage('Selenium Acceptance Test') {
        environment {
          CLASSPATH = ".:/var/jar_repo/htmlunit-driver-2.42.0-jar-with-dependencies.jar:/var/jar_repo/selenium-server-standalone-3.141.59.jar:/var/jar_repo/testng-6.0.1.jar"
        }
        stages {
          stage('Configuring Values for Testing') {
            steps {
              sh '''sed -i \"s/INPUT1/${INPUT1}/\" seleniumtest/HtmlAddTest.java'''
              sh '''sed -i \"s/INPUT2/${INPUT2}/\" seleniumtest/HtmlAddTest.java'''
              sh '''sed -i \"s/RESULT/${ADDRESULT}/\" seleniumtest/HtmlAddTest.java'''
            }
          }
          stage('Executing Acceptance Testing') {
            steps {
              sh 'cd seleniumtest && javac HtmlAddTest.java'
              sh 'cd seleniumtest && java HtmlAddTest'
            }
          }
        }
      }

    //   stage('Deploy to Kubernetes') {
    //     steps {
    //       //sh "sudo kubectl apply -f kubernetes/deploy-svc.yml"
    //       //sh "sudo kubectl set image deploy/webapp-demo-deploy webapp=docker.io/${params.DOCKER_U}/tomcat:pipeline-${BUILD_ID}"
    //       //sh("kubectl set image deploy/ab-deploy-tomcat tomcat=${params.DOCKER_U}/tomcat:pipeline-${env.BUILD_ID}")
    //     }
    //   }

    }
}
