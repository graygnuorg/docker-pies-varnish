FROM graygnuorg/pies:latest as pies
FROM varnish:stable
COPY --from=pies /pies /pies
COPY varnish.conf /pies/conf.d
RUN rm -rf /var/lib/varnish/*
ENTRYPOINT ["/pies/conf/rc"]
EXPOSE 8073 80 8443
