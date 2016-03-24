FROM ubuntu:14.04

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y -q build-essential python-all python-dev libpython-dev libevent-dev python-matplotlib

CMD pip install --upgrade pip

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -qr /tmp/requirements.txt
# RUN pip install jupyter

# ADD ./webapp /opt/webapp/
WORKDIR /opt/py-app

EXPOSE 8888

CMD python --version
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]