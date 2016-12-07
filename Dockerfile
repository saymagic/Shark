FROM ubuntu

# 签名
MAINTAINER saymagic "saymagic@163.com"

RUN mkdir -p /usr/local/app
COPY . /usr/local/app
WORKDIR /usr/local/app

RUN apt-get update && \  
      apt-get install -y git \
                       curl \
                       python \
                       python-dev \
                       python-pip  \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && pip install -r requirements.txt \
    && git clone https://saymagic@bitbucket.org/saymagic/getlink.git

EXPOSE 80

CMD python /usr/local/app/getlink/myapp.py

