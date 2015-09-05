String users = "user"
String statusBuild = "fail"
/*
String statusBuild = "" - all
String statusBuild = "fail" -fail
*/

def buildEnvVarsMap = Thread.currentThread().executable.envVars
String jen = buildEnvVarsMap?.JENKINS_URL
String job = buildEnvVarsMap?.JOB_NAME
String buildNumber = buildEnvVarsMap?.BUILD_NUMBER

String mess = "$jen"+"job/"+"$job"+"/" + "$buildNumber"


["/bin/bash", "/data/jenkins/Script/sendToSkype.sh" , "${users}", "${mess}", "${statusBuild}"].execute()