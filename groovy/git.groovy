import jenkins.model.*

def instance = Jenkins.getInstance()

def desc = instance.getDescriptor("hudson.plugins.git.GitSCM")

desc.setGlobalConfigName("Jenkins")
desc.setGlobalConfigEmail("robots@kinoba.fr")

desc.save()
