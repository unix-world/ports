COMMENT=		DNS toolkit for Python

# dnspython>=2 is py3-only; this old version is kept around for
# python 2 until mail/mailman can be updated
MODPY_VERSION =	${MODPY_DEFAULT_VERSION_2}

MODPY_DISTV=	1.16.0
REVISION=		6
DISTNAME=		dnspython-${MODPY_DISTV}
PKGNAME=		py-${DISTNAME}
CATEGORIES=		net

HOMEPAGE=		https://www.dnspython.org/

# BSD
PERMIT_PACKAGE=		Yes

SITES=			${HOMEPAGE}kits/${MODPY_DISTV}/

MODULES=		lang/python
MODPY_SETUPTOOLS=	Yes
MODPY_ADJ_FILES=	examples/*.py
NO_TEST=		Yes

.include <bsd.port.mk>
