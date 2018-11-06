# Jenkins master Docker image

## Setup

- Clone this repository
- Move the required params from the folder `params.dist` to the folder `params`:

```
cp params.dist/* params/
```

- Change the params inside __each__ of the files in the params folder according to your setup.

- Manually add public ssh keys


## Start the Docker container

```
docker run  -u root \
            --rm \
            -d \
            -p 8080:8080 \
            -p 50000:50000 \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v /home/jenkins:/var/lib/jenkins \
            kinoba/jenkins-custom-image
```

## Improve this Docker image

To build the image run:

```
docker build -t kinoba/jenkins-custom-image .
```
