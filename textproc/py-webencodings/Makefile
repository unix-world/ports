COMMENT=	character encoding aliases for legacy web content

MODPY_DISTV=	0.5.1
DISTNAME=	webencodings-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	textproc
REVISION=	10

HOMEPAGE=	https://github.com/gsnedders/python-webencodings

# BSD
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
MODPY_PYBUILD=	setuptools
MODPY_PI=	Yes

MODPY_PYTEST_ARGS= webencodings/tests.py

.include <bsd.port.mk>
