FROM ubuntu:14.04

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y -q build-essential libblas-dev liblapack-dev libatlas-base-dev gfortran libevent-dev python-all python-dev libpython-dev python-pip python-matplotlib

CMD pip install --upgrade pip

# ADD ./webapp /opt/webapp/
WORKDIR /opt/py-app

ADD ./requirements.txt /tmp/requirements.txt
RUN sudo pip --log /opt/py-app/logs install -r /tmp/requirements.txt
# RUN pip install jupyter

EXPOSE 8888

CMD python --version
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]