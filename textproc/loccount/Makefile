COMMENT =		count lines of codes in many languages

V =			2.16
DISTNAME =		loccount-${V}
CATEGORIES =		textproc

HOMEPAGE =		https://gitlab.com/esr/loccount

MAINTAINER =		Klemens Nanni <kn@openbsd.org>
# BSD
PERMIT_PACKAGE =	Yes
# statically linked
WANTLIB =		c pthread

SITES =			https://gitlab.com/esr/loccount/-/archive/${V}/

MODULES =		lang/python
MODPY_RUNDEP =		No
MODPY_ADJ_FILES =	tablegen.py

CONFIGURE_STYLE =	XXX: do not execute MODPY_BUILD_TARGET in python.port.mk:250

BUILD_DEPENDS =		lang/go \
			textproc/asciidoctor

MAKE_ENV =		GOCACHE=${WRKDIR}/go-cache GO111MODULE=off
ALL_TARGET =		loccount loccount.1
TEST_TARGET =		check

# uses $(shell ...)
USE_GMAKE =		Yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/loccount-${V} ${PREFIX}/bin/loccount
	${INSTALL_MAN} ${WRKBUILD}/loccount.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
