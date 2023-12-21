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
        def env = params.ENV // Get the value of ENV parameter
        sh 'terraform init -backend-config=env-${ENV}/state.tfvars'
        sh 'terraform plan -var-file=env-${ENV}/inputs.tfvars'
      }
    }

   stage('Terraform Apply') {
      input {
        message "Should we continue?"
    }
      steps {
        def env = params.ENV // Get the value of ENV parameter
        def action = params.ACTION // Get the value of ACTION parameter
        sh 'terraform ${ACTION} -var-file=env-${ENV}/inputs.tfvars -auto-approve'
      }
    }
  }
}