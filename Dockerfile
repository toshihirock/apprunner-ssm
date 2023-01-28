FROM nginx:latest

RUN mkdir /tmp/ssm && mkdir /tmp/cli
RUN apt-get update && apt-get install -y curl unzip

# SSM
RUN curl https://s3.ap-northeast-1.amazonaws.com/amazon-ssm-ap-northeast-1/latest/debian_amd64/amazon-ssm-agent.deb -o /tmp/ssm/amazon-ssm-agent.deb
RUN dpkg -i /tmp/ssm/amazon-ssm-agent.deb

# AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/cli/"awscliv2.zip"
RUN unzip /tmp/cli/awscliv2.zip -d /tmp/cli/ && /tmp/cli/aws/install

COPY start.sh start.sh

CMD ["/bin/bash", "./start.sh"]
