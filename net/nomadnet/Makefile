COMMENT =		Reticulum based mesh communication

MODPY_DISTV =		0.6.1
DISTNAME=		nomadnet-${MODPY_DISTV}
PKGNAME =		${DISTNAME}
REVISION =		0

CATEGORIES =		net

HOMEPAGE =		https://github.com/markqvist/nomadnet

MAINTAINER =		Aaron Bieber <abieber@openbsd.org>

# GPLv3
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools

NO_TEST =		Yes

RUN_DEPENDS =		devel/py-urwid \
			net/py-rns \
			net/py-lxmf

.include <bsd.port.mk>
