# Setting the base image of which docker image is being created
FROM jenkins/jenkins:lts
RUN /usr/local/bin/install-plugins.sh
ENV JAVA_OPTS -Xms256m -Xmx512m
CMD /bin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT

LABEL maintainer="email@example.com"
LABEL description="Jenkins Latest and Flutter : Docker Image"

# Switching to root user to install dependencies and flutter
USER root

# Installing the different dependencies required for Flutter, installing flutter from beta channel from github and giving permissions to jenkins user to the folder
RUN apt-get update && apt-get install -y git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 \
    && apt-get clean \
    && git clone -b beta https://github.com/flutter/flutter.git /usr/local/flutter \
    && chown -R jenkins:jenkins /usr/local/flutter

# Switching to jenkins user - a good practice
USER jenkins

# Getting flutter packages 
RUN flutter pub get

# Running flutter doctor to check if flutter was installed correctly
RUN /usr/local/flutter/bin/flutter doctor -v \
    && rm -rfv /flutter/bin/cache/artifacts/gradle_wrapper

# Setting flutter and dart-sdk to PATH so they are accessible from terminal
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

