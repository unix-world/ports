COMMENT=	lightweight C ACMEv2 client, uses external authenticators

V=		1.7.6
GH_ACCOUNT=	ndilieto
GH_PROJECT=	uacme
GH_TAGNAME=	upstream/$V
DISTNAME=	uacme-$V

CATEGORIES=	security www

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

# GPLv3+
PERMIT_PACKAGE=	Yes

WANTLIB += c crypto curl ssl

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-openssl

LIB_DEPENDS=	net/curl
BUILD_DEPENDS=	textproc/asciidoc
USE_GMAKE=	Yes

.include <bsd.port.mk>
