ARG PIES_TAG
FROM graygnuorg/pies:alpine-${PIES_TAG} as pies
ARG ADD_PACKAGES=
ARG VIRT_PACKAGES=
RUN apk add gcc musl-dev pcre readline libexecinfo ${ADD_PACKAGES} && \
    apk add --no-cache --virtual BUILD_DEPS alpine-sdk git autoconf automake linux-headers py3-pip py3-sphinx pcre-dev readline-dev libexecinfo-dev ${VIRT_PACKAGES}&& \
    pip3 install --no-cache-dir docutils
WORKDIR /usr/src
ARG VARNISH_VERSION
RUN wget http://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz && \
    tar xf varnish-${VARNISH_VERSION}.tgz && \
    cd varnish-${VARNISH_VERSION} && \
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
		--localstatedir=/var/lib \
		--without-jemalloc && \
    make && \
    make install && \
    rm -rf /usr/share/man
COPY tree/ /
RUN cd /usr/local/bin && \
    for file in /usr/sbin/varnish* /usr/bin/varnish*;\
    do \
        bn=$(basename $file); \
	test -f $bn || ln -sf varnishd $bn; \
    done
RUN apk del BUILD_DEPS; rm -rf /usr/src /var/lib/varnish/*
EXPOSE 8073 80 8443
WORKDIR /etc/varnish

		