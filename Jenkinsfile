node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
//      git branch: 'master' , credentialsId: '2001c6bf-5bbc-4a47-b442-7b612921719e', url: 'https://github.com/nikitaz4/helloWorld.git'
//      properties([pipelineTriggers([[$class: 'GitHubPushTrigger'], pollSCM('* * * * *')])])
//      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'WipeWorkspace'] , [$class: 'LocalBranch', localBranch: 'master']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bea5bec6-672e-4de0-8cbf-48b4e26d4b53', url: 'https://github.com/nikitaz4/helloWorld.git']]])
//      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bea5bec6-672e-4de0-8cbf-48b4e26d4b53', url: 'https://github.com/nikitaz4/helloWorld.git']]])
        git credentialsId: 'bea5bec6-672e-4de0-8cbf-48b4e26d4b53', url: 'git@github.com:nikitaz4/helloWorld.git', branch: 'master'
      mvnHome = tool 'maven'
   }
   stage('Build') {
       echo ""
       sh "${mvnHome}/bin/mvn -f my-app/pom.xml clean install" 
   }
   stage ('release'){
       def userInput = input(
        id: 'userInput', message: 'release?' , parameters: [
        [$class: 'BooleanParameterDefinition', defaultValue: false, description: '', name: 'Please confirm you agree with this']
        ])
        sh "${mvnHome}/bin/mvn -f my-app/pom.xml release:prepare release:perform -Darguments=-Dmaven.deploy.skip=true"
//        sh "${mvnHome}/bin/mvn -f my-app/pom.xml release:perform -Darguments=-Dmaven.deploy.skip=true"
   }
   

}
