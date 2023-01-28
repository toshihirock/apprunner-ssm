FROM nginx:latest

RUN mkdir /tmp/ssm
RUN apt-get update && apt-get install -y curl
RUN curl https://s3.ap-northeast-1.amazonaws.com/amazon-ssm-ap-northeast-1/latest/debian_amd64/amazon-ssm-agent.deb -o /tmp/ssm/amazon-ssm-agent.deb
RUN dpkg -i /tmp/ssm/amazon-ssm-agent.deb
COPY start.sh start.sh

CMD ["/bin/bash", "./start.sh"]
