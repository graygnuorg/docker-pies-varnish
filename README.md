# Varnish + Pies

This is a source repository for [Varnish+Pies](https://hub.docker.com/r/graygnuorg/varnish) docker image.

The image runs [Varnish Cache server](https://varnish-cache.org/) supervised
by [GNU pies](http://www.gnu.org.ua/software/pies/).  For a description of
its internal structure and ways of using it as a base image, refer to the
[GNU pies image documentation](https://github.com/graygnuorg/docker-pies).

Pies configuration file for running Varnish as a component is located in
`/pies/conf.d/varnish.conf'.

## License

GNU Pies is distributed under [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.html), version 3 or later.  Varnish Cache is distributed under
[two-clause BSD license](https://github.com/varnishcache/varnish-cache/blob/master/LICENSE).  This image can be distributed using either license, at your option.
