COMMENT =		birthday reminder with tray notification

GH_ACCOUNT =		lafrech
GH_PROJECT =		qbirthday
GH_TAGNAME =		v0.7.0b3
REVISION =		5

CATEGORIES =		productivity x11

MAINTAINER =		Kirill Bychkov <kirby@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
RUN_DEPENDS =		devel/desktop-file-utils \
			x11/gtk+4,-guic \
			x11/py-qt5
NO_TEST =		Yes

MODPY_ADJ_FILES +=	src/qb

NO_BUILD =		Yes
MODPY_BUILDDEP =	Yes

post-patch:
	sed -i 's,_Comment,Comment,' ${WRKSRC}/qbirthday.desktop.in

pre-install:
	find ${WRKSRC} -name \*.orig -delete

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/qb ${PREFIX}/bin/qbirthday
	${INSTALL_DATA_DIR} ${PREFIX}/lib/python${MODPY_VERSION}/site-packages/
	cd ${WRKSRC}/src/ && pax -rw qbirthday \
		${PREFIX}/lib/python${MODPY_VERSION}/site-packages/
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/qbirthday.desktop.in \
		${PREFIX}/share/applications/qbirthday.desktop
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/scalable/apps/
	${INSTALL_DATA} ${WRKSRC}/pics/qbirthday.svg \
		${PREFIX}/share/icons/hicolor/scalable/apps/

post-install:
	${MODPY_COMPILEALL} \
		${PREFIX}/lib/python${MODPY_VERSION}/site-packages/qbirthday

.include <bsd.port.mk>
