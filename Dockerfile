FROM postgres:alpine
LABEL maintainer "cuong@techmaster.vn"

ENV POSTGIS_VERSION "2.3.3dev"

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update-cache add --no-cache --virtual .build-deps \
        perl \
        gcc \
        make \
        libgcc g++ && \
    apk --update-cache add --no-cache  \
        postgresql-dev \
        geos@testing \
        geos-dev@testing \
        libxml2-dev \
        gdal@testing \
        gdal-dev@testing \
        proj4@testing \
        proj4-dev@testing \
        json-c && \
    cd /tmp && \
    wget http://postgis.net/stuff/postgis-${POSTGIS_VERSION}.tar.gz -O - | tar -xz && \
    chown root:root -R postgis-${POSTGIS_VERSION} && \
    cd /tmp/postgis-${POSTGIS_VERSION} && \
    ./configure && \
    make -s && \
    make -s install  && \
    cd / && \
    rm -rf /tmp/postgis-${POSTGIS_VERSION} && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

