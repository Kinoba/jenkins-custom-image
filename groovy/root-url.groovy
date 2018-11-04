import jenkins.model.JenkinsLocationConfiguration

jlc = JenkinsLocationConfiguration.get()
jlc.setUrl("https://jenkins.kinoba.fr:30443/") 
jlc.save()
