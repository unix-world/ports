COMMENT =		web reconnaissance framework

GH_ACCOUNT =		lanmaster53
GH_PROJECT =		recon-ng
GH_TAGNAME =		v5.1.2
REVISION =		2

HOMEPAGE =		https://github.com/lanmaster53/recon-ng

MAINTAINER =		Sebastian Reitenbach <sebastia@openbsd.org>

CATEGORIES =		security

# GPLv3
PERMIT_PACKAGE =	Yes

RUN_DEPENDS =		devel/py-olefile \
			devel/py-xlsxwriter \
			net/py-dnspython \
			textproc/py-dicttoxml \
			textproc/py-lxml \
			textproc/py-unicodecsv \
			www/py-flask \
			www/py-mechanize

# Could make use of:
# PyPDF2
# slowaes

MODULES =		lang/python

NO_BUILD =		Yes
NO_TEST =		Yes

SUBST_VARS +=		GH_TAGNAME

MODPY_ADJ_FILES =	recon-cli recon-ng recon-web

pre-install:
	${SUBST_CMD} ${WRKSRC}/recon/core/base.py
	rm ${WRKSRC}/recon/core/*{.beforesubst,${PATCHORIG}}

do-install:
.for s in cli ng web
	${INSTALL_SCRIPT} ${WRKSRC}/recon-$s ${PREFIX}/bin
.endfor
	${INSTALL_DATA_DIR} ${WRKINST}/${MODPY_SITEPKG}/recon/
	cd ${WRKSRC}/recon && umask 022 && pax -rw . ${WRKINST}/${MODPY_SITEPKG}/recon

.include <bsd.port.mk>

