COMMENT =	3D meshes and point clouds compressor/decompressor

GH_ACCOUNT =	google
GH_PROJECT =	draco
GH_TAGNAME =	1.5.7
SHARED_LIBS =	draco 0.0
REVISION =	0

CATEGORIES =	archivers
HOMEPAGE =	https://google.github.io/draco/

# Apache-2.0
PERMIT_PACKAGE =	Yes

COMPILER =	base-clang ports-gcc

WANTLIB +=	c m ${COMPILER_LIBCXX}

MODULES =	devel/cmake
BUILD_DEPENDS =	devel/gtest:patch
CONFIGURE_ARGS =-DBUILD_SHARED_LIBS=ON \
		-DDRACO_TESTS=ON \
		-DDRACO_GOOGLETEST_PATH=${WRKDIR}/devel/gtest/googletest-1.15.2

# everything but tests
ALL_TARGET =	draco_encoder draco_decoder

pre-test:
	# build whatever is left (ca. 57 C++ test files)
	${MODCMAKE_BUILD_TARGET}

do-test:
	cd ${WRKBUILD} && \
		./draco_tests && \
		./draco_factory_tests

.include <bsd.port.mk>
