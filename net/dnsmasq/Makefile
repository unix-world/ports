COMMENT=	lightweight caching DNS forwarder, DHCP and TFTP server

DISTNAME=	dnsmasq-2.91
CATEGORIES=	net
SITES=		https://thekelleys.org.uk/dnsmasq/
EXTRACT_SUFX=	.tar.xz

HOMEPAGE=	https://dnsmasq.org/

MAINTAINER=	Brad Smith <brad@comstyle.com>

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB=	c

MAKE_ENV=	CC="${CC}"
MAKE_FLAGS=	CFLAGS="${CFLAGS} -Wall -W"
FAKE_FLAGS=	MANDIR="${PREFIX}/man"

NO_TEST=	Yes

pre-build:
	@${SUBST_CMD} ${WRKSRC}/man/dnsmasq.8 ${WRKSRC}/src/config.h \
	    ${WRKSRC}/dnsmasq.conf.example

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/dnsmasq
	${INSTALL_DATA} ${WRKSRC}/dnsmasq.conf.example ${PREFIX}/share/examples/dnsmasq

.include <bsd.port.mk>
