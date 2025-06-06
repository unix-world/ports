COMMENT =	easy to use 2D geometry library in C++
BROKEN-sparc64=	no c++20 support on ports-gcc archs

V =		1.4
DISTNAME =	lib2geom-${V}

CATEGORIES =	geo graphics

SHARED_LIBS +=  2geom 3.0 #1.2.0

HOMEPAGE =	https://gitlab.com/inkscape/lib2geom

MAINTAINER =	Rafael Sadowski <rsadowski@openbsd.org>

# LGPL 2.1 and MPL 1.1
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} cairo double-conversion glib-2.0
WANTLIB += gsl gslcblas intl m

SITES =		https://gitlab.com/inkscape/lib2geom/-/archive/${V}/
EXTRACT_SUFX =	.tar.bz2

LIB2GEOM_VER =	${V}.0
SUBST_VARS +=	LIB2GEOM_VER

MODULES =	devel/cmake \
		lang/python

MODPY_RUNDEP =	no

# c++20
COMPILER =	base-clang ports-gcc

BUILD_DEPENDS =	devel/boost \
		devel/gtest \
		lang/cython \
		x11/gtk+3

LIB_DEPENDS =	math/double-conversion \
		devel/gsl \
		graphics/cairo \
		devel/gettext,-runtime \
		devel/glib2

CONFIGURE_ARGS =	-D2GEOM_BOOST_PYTHON=NO \
			-D2GEOM_BUILD_SHARED=YES

MODCMAKE_LDFLAGS =	-L${LOCALBASE}/lib

.include <bsd.port.mk>
