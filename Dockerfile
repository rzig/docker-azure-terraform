FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install unzip apt-transport-https lsb-release software-properties-common wget -y 
RUN wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
RUN unzip terraform_0.11.11_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
RUN rm -rf .terraform
RUN rm terraform_0.11.11_linux_amd64.zip

RUN AZ_REPO=$(lsb_release -cs)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv --keyserver packages.microsoft.com --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
RUN apt-get update
RUN apt-get install azure-cli -y
