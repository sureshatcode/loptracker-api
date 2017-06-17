node('ec2slaves') {
 properties([pipelineTriggers([
  [$class: 'GitHubPushTrigger']
 ])])
 stage 'Checkout'
 checkout scm
 stage 'Build'
 sh './gradlew clean'
 sh './gradlew zip'
}
