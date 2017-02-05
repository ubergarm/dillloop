FROM debian:sid

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            git \
            ca-certificates \
            build-essential \
            autoconf \
            automake \
            libtool \
            python3 \
            python3-pip \
            python3-dev

RUN pip3 install --upgrade \
         cython

RUN mkdir -p /usr/local/src

# install libdill
RUN cd /usr/local/src && \
    git clone https://github.com/sustrik/libdill.git && \
    cd libdill && \
    ./autogen.sh && \
    ./configure --enable-static --enable-debug && \
    make -j8 && \
    make install

# install libdsock
RUN cd /usr/local/src && \
    git clone https://github.com/sustrik/dsock.git && \
    cd dsock && \
    ./autogen.sh && \
    ./configure --enable-static --enable-debug && \
    export LD_LIBRARY_PATH=/usr/local/lib && \
    ldconfig && \
    make -j8 CFLAGS=-I/usr/local/include LDFLAGS=-ldill && \
    make install

COPY . /app

WORKDIR /app

CMD /bin/sh
