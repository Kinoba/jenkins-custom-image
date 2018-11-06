FROM jenkins/jenkins

LABEL "fr.kinoba"="Kinoba"
LABEL version="1.0"

ENV JENKINS_HOME /var/lib/jenkins
# Disable initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# VOLUME /var/lib/jenkins

RUN mkdir /usr/share/jenkins/ref/params
COPY params/ /usr/share/jenkins/ref/params

# Add custom user at startup
COPY groovy/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
# Enable CSRF protection
COPY groovy/csrf.groovy /usr/share/jenkins/ref/init.groovy.d/csrf.groovy
# Change Jenkins root URL
COPY groovy/root-url.groovy /usr/share/jenkins/ref/init.groovy.d/root-url.groovy
# Disable remoting
COPY groovy/disable-remoting.groovy /usr/share/jenkins/ref/init.groovy.d/disable-remoting.groovy
# Slack token
COPY groovy/slack.groovy /usr/share/jenkins/ref/init.groovy.d/slack.groovy
# Git global configuration
COPY groovy/git.groovy /usr/share/jenkins/ref/init.groovy.d/git.groovy
# SSH master private key
COPY groovy/ssh-key.groovy /usr/share/jenkins/ref/init.groovy.d/ssh-key.groovy

# Create slave nodes
COPY groovy/nodes/asus.groovy /usr/share/jenkins/ref/init.groovy.d/asus.groovy
COPY groovy/nodes/tower.groovy /usr/share/jenkins/ref/init.groovy.d/tower.groovy

# Install additional plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

USER jenkins
