#!/bin/sh
: ${IMAGENAME:?}
: ${PLATFORM:?}
set -x
: ${VARNISH_VERSION:=$VARNISH_TAG}
arglist=$(sed -r -n \
	      -e 's/^ARG[[:blank:]]([^=]+)((=)(.*))?[[:blank:]]*$/\1 \3/p' \
	      $PLATFORM/Dockerfile | \
          while read argname init
          do
	      case $init in
		  =) init=;;
		  *) init=':?'
	      esac
	      echo "--build-arg $argname=\${$argname${init}}"
          done)

eval docker build -t $IMAGENAME ${NOCACHE:+--no-cache} \
            $arglist \
 	    -f ${PLATFORM}/Dockerfile \
           .
