COMMENT=	POSIX-compliant command line shell

VERSION=	2.59
DISTNAME=	yash-${VERSION}
CATEGORIES=	shells
HOMEPAGE=	https://magicant.github.io/yash/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=		https://github.com/magicant/yash/releases/download/${VERSION}/
EXTRACT_SUFX=	.tar.xz

WANTLIB=	c curses intl m
LIB_DEPENDS=	devel/gettext,-runtime

CONFIGURE_STYLE=simple
CONFIGURE_ARGS=	--prefix="${PREFIX}" \
		--mandir="${PREFIX}/man"
CONFIGURE_ENV=	CPPFLAGS="-std=c99 -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

DEBUG_PACKAGES=	${BUILD_PACKAGES}

# The test script fails if none of LC_ALL, LC_CTYPE, or LANG is set
TEST_ENV=       LC_CTYPE=C

.include <bsd.port.mk>
