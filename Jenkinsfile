pipeline {
  agent { label 'new-workstation'}

  options {
    ansiColor('xterm')
  }
  
  parameters {
    choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Choose Environment')
    choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Action')
  }
  stages {
     
    stage('Terraform Plan') {
      steps {
        script {
          def env = params.ENV
          sh "terraform init -backend-config=env-${env}/state.tfvars"
          sh "terraform plan -var-file=env-${env}/inputs.tfvars"
        }
      }
    }

   stage('Terraform Apply') {
      input {
        message "Should we continue?"
    }
      steps {
        script {
          def env = params.ENV
          def action = params.ACTION
          input(message: "Should we continue?")
          sh "terraform ${action} -var-file=env-${env}/inputs.tfvars -auto-approve"
        }
      }
    }
  }
}