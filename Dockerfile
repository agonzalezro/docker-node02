FROM dockerfile/python
MAINTAINER "Alex Gonzalez <agonzalezro@gmail.com>"

RUN apt-get update
RUN apt-get install -y libssl-dev libv8-dev

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-v0.2.6.tar.gz && \
  tar zxvf node-v0.2.6.tar.gz && \
  rm *.tar.gz

RUN \
  cd /tmp/node-v0.2.6 && \
  export CC=/usr/bin/gcc && \
  export CXX="/usr/bin/g++ -Wno-unused-local-typedefs" &&  \
  ./configure --shared-v8 --without-ssl && \
  make && make install

WORKDIR /data

CMD ["bash"]
