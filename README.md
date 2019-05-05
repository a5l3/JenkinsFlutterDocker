# Jenkins Flutter Docker

### Jenkins file config for Flutter
Add the Jenkins file to your root flutter directory 

### Docker 
Build the Docker image
Once you have a docker image run: 
``` shell
docker run -u root --rm -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock docker-image-name:image-tag
```
