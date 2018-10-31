FROM jenkins/jenkins

ENV JENKINS_HOME /var/lib/jenkins
# Disable initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

VOLUME /var/lib/jenkins

# Add custom user at startup
COPY groovy/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY groovy/csrf.groovy /usr/share/jenkins/ref/init.groovy.d/csrf.groovy

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
