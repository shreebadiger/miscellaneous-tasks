pipeline{
    agent{
        node{
            label 'workstation'
        }
    }
    options{
        ansiColor('xterm')
    }
    stages{

    stage('apply'){
        steps{
              sh 'terraform init'
            sh 'terraform apply -auto-approve'

        }
    
    }
}
}
