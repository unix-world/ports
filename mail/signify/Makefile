COMMENT=	dynamic .signature generator

DISTNAME=	signify-1.11
CATEGORIES=	mail

HOMEPAGE=	https://signify.sourceforge.net/

REVISION =	1

# Public domain
PERMIT_PACKAGE=	Yes

SITES=		${SITE_SOURCEFORGE:=signify/}

NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

WRKDIST=	${WRKDIR}/signify

EXAMPLESDIR=	${PREFIX}/share/examples/signify

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/signify.pl ${PREFIX}/bin/signify
	${INSTALL_MAN} ${WRKSRC}/signify.1 ${PREFIX}/man/man1
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
.for f in Columned Complex Simple SimpleOrColumned
	${INSTALL_DATA} ${WRKSRC}/examples/${f} ${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
