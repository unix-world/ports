COMMENT=	Apache Portable Runtime

V=		1.7.5
REVISION=	0
DISTNAME=	apr-$V
SHARED_LIBS +=	apr-1             7.2     # .6.2

CATEGORIES=	devel

MAINTAINER=	Stefan Sperling <stsp@openbsd.org>

HOMEPAGE=	https://apr.apache.org/

# Apache License 2.0
PERMIT_PACKAGE=	Yes

WANTLIB += 	pthread

SITES=		${SITE_APACHE:=apr/}

AUTOCONF_VERSION=2.72
CONFIGURE_STYLE=autoconf autoheader
# Prevent APR pools from re-using dynamic memory allocations:
CFLAGS +=	"-DAPR_ALLOCATOR_MAX_FREE_DEFAULT=1"
CONFIGURE_ARGS=	--includedir=${LOCALBASE}/include/apr-1/ \
		--with-installbuilddir=${LOCALBASE}/lib/apr-1/ \
		--enable-other-child \
		--enable-threads \
		ac_cv_prog_AWK=awk
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build

post-configure:
	sed -i 's@$${LIBTOOL}@${LIBTOOL}@' ${WRKBUILD}/apr-1-config

pre-install:
	rm -f ${WRKSRC}/libtool

.include <bsd.port.mk>
