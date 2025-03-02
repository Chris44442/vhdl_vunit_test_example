FROM ubuntu:24.04

RUN apt-get -y update

# install vunit test framework
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN pip install vunit_hdl --break-system-packages

# install nvc simulator for vhdl
RUN apt-get install -y git
RUN apt-get install -y build-essential automake autoconf \
  flex check llvm-dev pkg-config zlib1g-dev libdw-dev \
  libffi-dev libzstd-dev
RUN git clone https://github.com/nickg/nvc.git && \
  cd nvc && \
  ./autogen.sh && \
  mkdir build && cd build &&\
  ../configure &&\
  make &&\
  make install

WORKDIR /home

