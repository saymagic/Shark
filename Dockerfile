FROM ubuntu

# 签名
MAINTAINER saymagic "saymagic@163.com"

RUN mkdir -p /usr/local/app
COPY . /usr/local/app
WORKDIR /usr/local/app

RUN apt-get update && \  
      apt-get install -y git \
                       curl \
                       nginx \
                       python \
                       python-dev \
                       python-pip  \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && pip install -r requirements.txt \
    && git clone https://saymagic@bitbucket.org/saymagic/getlink.git

COPY ./nginx_config /etc/nginx/conf.d

EXPOSE 80 3000

CMD nginx && python /usr/local/app/getlink/myapp.py

