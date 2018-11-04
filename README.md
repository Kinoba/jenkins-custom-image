# Jenkins master Docker image

## Run

### Prerequisites

Change the params inside the params folder according to your setup.

```
docker run   -u root   --rm   -d   -p 8080:8080   -p 50000:50000   -v /var/run/docker.sock:/var/run/docker.sock   kinoba/jenkins-custom-image
```
