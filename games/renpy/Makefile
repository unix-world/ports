BROKEN =		needs update for cython 3.x - current upstream version works with py 3.x

COMMENT =		visual novel engine

V =			7.3.5
MODPY_DISTV =	${V}.606
DISTNAME =		renpy-${V}-source
PKGNAME =		renpy-${V}
REVISION =		2

CATEGORIES =		games

HOMEPAGE =		https://www.renpy.org/

# mostly MIT, some files LGPLv2.1+
PERMIT_PACKAGE =		Yes

WANTLIB += GLEW SDL2 avcodec avformat avutil freetype
WANTLIB += m png pthread swresample swscale z ${MODPY_WANTLIB}

SITES =			https://www.renpy.org/dl/${V}/
EXTRACT_SUFX =		.tar.bz2

MODULES =		lang/python
MODPY_VERSION =	${MODPY_DEFAULT_VERSION_2}

BUILD_DEPENDS =		devel/py2-pygame \
			games/pygame_sdl2 \
			lang/cython

RUN_DEPENDS =		games/pygame_sdl2

# XXX enable fribidi support
LIB_DEPENDS =		graphics/ffmpeg \
			graphics/glew

MAKE_ENV =		RENPY_DEPS_INSTALL=/usr::${LOCALBASE}::${X11BASE}

CFLAGS +=		-I/usr/X11R6/include

NO_TEST =		Yes

WRKSRC =		${WRKDIST}/module

# XXX not needed in newer releases
MODPY_ADJ_FILES =	../renpy.py

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/renpy
	cd ${WRKDIST} && \
	cp -r launcher renpy the_question tutorial LICENSE.txt \
		${PREFIX}/share/renpy
	${INSTALL_SCRIPT} ${WRKDIST}/renpy.py ${PREFIX}/share/renpy
	${SUBST_PROGRAM} ${FILESDIR}/renpy ${PREFIX}/bin/renpy
	${SUBST_PROGRAM} ${FILESDIR}/renpyify ${PREFIX}/bin/renpyify

.include <bsd.port.mk>
