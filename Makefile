VERSION=6.0

all: .varnish-$(VERSION).ts	

.varnish-%.ts: Dockerfile
	docker build -t graygnuorg/varnish:$* $(CACHE) .
	touch $@
