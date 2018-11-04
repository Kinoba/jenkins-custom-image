#!groovy
import jenkins.model.*
import hudson.plugins.slack.*
import hudson.util.Secret
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.common.*
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl

def instance = Jenkins.getInstance()

def token = new File("/usr/share/jenkins/ref/params/slack-token").text.trim()
def channel = new File("/usr/share/jenkins/ref/params/slack-channel").text.trim()
def baseUrl = new File("/usr/share/jenkins/ref/params/slack-base-url").text.trim()

credentials = new StringCredentialsImpl(
  CredentialsScope.GLOBAL,
  "jenkins_slack_token",
  "slack token",
  new Secret(token))
SystemCredentialsProvider.instance.store.addCredentials(Domain.global(), credentials)

def _slack = instance.getDescriptorByType(jenkins.plugins.slack.SlackNotifier.DescriptorImpl)
_slack.room = channel
_slack.tokenCredentialId = credentials.id
_slack.baseUrl = baseUrl
_slack.save()
