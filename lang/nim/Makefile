ONLY_FOR_ARCHS =	amd64 arm64 i386

COMMENT =		statically typed systems programming language

DISTNAME =		nim-1.6.18
EXTRACT_SUFX =		.tar.xz
REVISION =		2

CATEGORIES =		lang

HOMEPAGE =		https://nim-lang.org/
SITES =			${HOMEPAGE}download/

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB =		c m pthread

MODULES =		lang/python

PORTHOME =		${WRKDIR}
TEST_DEPENDS =		archivers/p7zip,-main \
			archivers/unzip \
			devel/boehm-gc \
			devel/pcre \
			lang/node \
			multimedia/sfml

SUBST_VARS +=		CFLAGS

post-patch:
	mkdir -p ${WRKSRC}/nimcache-port
	mkdir -p ${WRKSRC}/nimcache-port-test
	perl -i -pe "s#NIM_PORT_PATH#${PATH}#" ${WRKSRC}/koch.nim
	perl -i -pe "s#NIM_PORT_CACHE#${WRKSRC}/nimcache-port-test#" \
		${WRKSRC}/koch.nim

pre-configure:
	${SUBST_CMD} ${WRKSRC}/config/nim.cfg

do-build:
	cd ${WRKSRC} && ${SETENV} CC="${CC}" LINKER="${CC}" \
		COMP_FLAGS="${CPPFLAGS} ${CFLAGS}" LINK_FLAGS="${LDFLAGS}" \
		CFLAGS="${CFLAGS}" sh build.sh
	cd ${WRKSRC} && bin/nim c -d:release --parallelBuild:${MAKE_JOBS} \
		--nimcache:"${WRKSRC}/nimcache-port" --listFullPaths \
		--listCmd --putenv:"PATH=${PATH}" koch
.for t in boot nimble tools
	cd ${WRKSRC} && ./koch $t -d:release --parallelBuild:${MAKE_JOBS} \
		--nimcache:"${WRKSRC}/nimcache-port" --listFullPaths \
		--listCmd --putenv:"PATH=${PATH}"
.endfor

do-install:
.for b in nim nimble nimpretty nimgrep nimsuggest testament
	${INSTALL_PROGRAM} ${WRKSRC}/bin/$b ${PREFIX}/bin
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/lib/nim
	cp -R ${WRKSRC}/lib/* ${PREFIX}/lib/nim
	${MODPY_COMPILEALL} ${PREFIX}/lib/nim/pure/unidecode/gen.py
	chown -R ${LIBOWN}:${LIBGRP} ${PREFIX}/lib/nim
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/nim
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${PREFIX}/share/doc/nim
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/nim
	${INSTALL_DATA} ${WRKSRC}/config/*.cfg ${PREFIX}/share/examples/nim

# note that for some tests an internet connection is required
do-test:
	cd ${WRKSRC} && ${SETENV} ${ALL_TEST_ENV} ./koch tests all -d:release \
		--parallelBuild:1
		--nimcache:"${WRKSRC}/nimcache-port-test" \
		--putenv:"PATH=${PATH}"

.include <bsd.port.mk>
