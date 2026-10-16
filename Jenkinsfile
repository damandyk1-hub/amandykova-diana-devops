pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Diana'
        STUDENT_SURNAME = 'Amandykova'
        STUDENT_GROUP   = 'IT-2314'
        STUDENT_ID      = '41547'
        IMAGE     = 'amandykova-diana-devops'
        CONTAINER = 'amandykova-diana-container'
    }

    options {
        skipDefaultCheckout()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --pretty=format:"%h %s"'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                    echo "Group: $STUDENT_GROUP"
                    echo "Student ID: $STUDENT_ID"
                    chmod +x scripts/Amandykova_Diana_system.sh tests/test_project.sh
                    ./scripts/Amandykova_Diana_system.sh
                '''
            }
        }

        stage('Test') {
            steps {
                sh './tests/test_project.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker stop $CONTAINER || true
                    docker rm $CONTAINER || true
                    docker run -d --name $CONTAINER \
                      -e STUDENT_NAME -e STUDENT_SURNAME -e STUDENT_GROUP -e STUDENT_ID \
                      $IMAGE
                    sleep 3
                    docker ps --filter name=$CONTAINER
                    docker logs $CONTAINER
                '''
            }
        }
    }
}
