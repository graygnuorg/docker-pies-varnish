ARG PIES_TAG
ARG VARNISH_TAG
FROM graygnuorg/pies:debian-${PIES_TAG} as pies
FROM varnish:${VARNISH_TAG}
COPY --from=pies /pies /pies
COPY tree/pies/conf.d/varnish.conf /pies/conf.d
ENV PATH="/pies/sbin:/pies/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
RUN rm -rf /var/lib/varnish/*
ENTRYPOINT ["/pies/conf/rc"]
EXPOSE 8073 80 8443
