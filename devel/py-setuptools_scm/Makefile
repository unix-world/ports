COMMENT=	plugin to manage your versions by scm tags

MODPY_DISTV=	8.3.1
DISTNAME=	setuptools_scm-${MODPY_DISTV}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	devel
REVISION=	0

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
MODPY_PI=	Yes
# uses own in-tree backend which wraps setuptools
MODPY_PYBUILD=	other

RUN_DEPENDS=	devel/py-setuptools \
		sysutils/py-packaging
BUILD_DEPENDS=	${RUN_DEPENDS}

# some tests need network
PORTHOME=	${WRKDIR}
TEST_DEPENDS=	${FULLPKGNAME}:${FULLPKGPATH} \
		devel/git \
		devel/mercurial \
		devel/py-pip

pre-test:
	ln -fs ${MODPY_BIN} ${WRKDIR}/bin/python

.include <bsd.port.mk>
