FROM jenkins/jenkins:lts-jdk17
USER root
ENV TZ=Asia/Calcutta
RUN apt update
RUN apt install -y sudo wget python3 libpq-dev gpg unzip python3-dev jq vim python3-pip gnupg ca-certificates flak e8 curl gnupg postgresql-client awscli ffmpeg
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg-dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r/etc/apt/keyrings/docker.gpg
RUN echo "deb [arch="$(dpkg -print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN wget -0- https://apt.releases.hashicorp.com/gpg | gpg --dearmor> /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(Isb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list
RUN apt update && apt install -y terraform
RUN wget -0- https://apt.releases.hashicorp.com/gpg | sudo gpg-dearmor yes -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg) https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update && apt install -y vault
