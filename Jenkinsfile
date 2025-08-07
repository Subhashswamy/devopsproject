pipeline{
    agent any
    environment {
        DOCKER_IMAGE = 'subhashswamy/devproject:latest'
    }
    
    stages{
        stage('cloning from git'){
            steps{
                git branch: 'Subhashswamy-localhost-version', url: 'https://github.com/Subhashswamy/devopsproject.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }
        stage('Pushing image to docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHUb', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]){
                sh'''
                echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                docker push $DOCKER_IMAGE
                '''
                }
            }
        }
        stage('deploying using kubernetes'){
            steps{
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubeconfig', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    sh '''
                    kubectl delete --all pod
                    kubectl apply -f deployment.yaml
                    kubectl apply -f my-app-service.yaml
                    kubectl apply -f mongo-service.yaml
                    kubectl apply -f mongo-express-service.yaml
                    '''
                }
            }
        }
    }
}
