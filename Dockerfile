FROM centos:7.9.2009

WORKDIR /python_api

COPY app.py .
COPY requirements.txt .

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS-*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS-*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS-*.repo

RUN yum clean all

RUN yum update -y
RUN yum install epel-release -y

RUN yum install python3 python3-pip -y

RUN pip3 install flask
RUN pip3 install flask-jsonpify
RUN pip3 install flask-restful
#RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python3", "app.py" ]
