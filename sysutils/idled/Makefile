COMMENT=	log out idle users and those hogging resources

DISTNAME=	idled-1.16
REVISION=	2
CATEGORIES=	sysutils
SITES=		http://www.netsw.org/system/tools/process/

FAKE_FLAGS=	PREFIX=${PREFIX}

PERMIT_PACKAGE=	Yes
WANTLIB=		c

MAKE_ENV=	SYSCONFDIR="${SYSCONFDIR}"

NO_TEST=	Yes

post-extract:
	@cd ${WRKSRC} && ${MAKE_PROGRAM} clean

.include <bsd.port.mk>
