FROM graygnuorg/pies:1.5
RUN . /etc/os-release && \
    echo "deb https://packagecloud.io/varnishcache/varnish60lts/debian/ $VERSION_CODENAME main" > /etc/apt/sources.list.d/varnish.list && \
    apt-key adv --keyserver keys.gnupg.net --recv-keys \
      48D81A24CB0456F5D59431D94CFCFD6BA750EDCD && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends varnish
COPY varnish.conf /etc/pies.d
EXPOSE 80 8443
