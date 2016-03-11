FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM linux
RUN apt-get update && apt-get -y install \ 
    git \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    build-essential \
    libxml2-dev \ 
    libxslt1-dev \ 
    zlib1g-dev
RUN mkdir -p rtd/checkouts && \
    cd rtd/checkouts && \
    git clone https://github.com/rtfd/readthedocs.org.git && \
    cd readthedocs.org/ && \
    pip install -r requirements.txt && \
    ./manage.py migrate

