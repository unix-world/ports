COMMENT =	python Qt5WebEngine bindings

MODPY_DISTV =	5.15.7
DISTNAME =	PyQtWebEngine-${MODPY_DISTV}
PKGNAME =	py-qtwebengine-${MODPY_DISTV}
REVISION =	0

CATEGORIES =	www devel

HOMEPAGE =	https://www.riverbankcomputing.com/software/pyqtwebengine/intro

# GPLv3 with exceptions for use with certain named open-source licenses
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} GL Qt5Core Qt5Gui Qt5Network Qt5Positioning
WANTLIB += Qt5PrintSupport Qt5Qml Qt5QmlModels Qt5Quick Qt5WebChannel
WANTLIB += Qt5WebEngine Qt5WebEngineCore Qt5WebEngineWidgets Qt5Widgets
WANTLIB += m

MODULES =	lang/python \
		x11/qt5

MODPY_PI =	Yes

LIB_DEPENDS =	x11/qt5/qtwebengine

RUN_DEPENDS =		x11/py-sip-qt5 \
			devel/py-sip \
			x11/py-qt5

BUILD_DEPENDS =		x11/py-sip-qt5 \
			devel/py-sip \
			devel/py-qt-builder \
			x11/py-qt5

QTVER =			qt5
PYQTVER =		PyQt5
SUBST_VARS +=		QTVER PYQTVER

CONFIGURE_STYLE =	simple
CONFIGURE_SCRIPT =	${LOCALBASE}/bin/sip-build
CONFIGURE_ARGS =	--verbose

MAKE_FLAGS =		-C build \
			CC=${CC} \
			CXX=${CXX} \
			COPTS="${CFLAGS}" \
			CXXOPTS="${CXXFLAGS}"

FAKE_FLAGS =		INSTALL_ROOT=${DESTDIR}

NO_TEST =		Yes

post-extract:
	# Needed to run sip-6.5+ sip-build
	ln -sf ${MODQT5_QMAKE} ${WRKDIR}/bin/qmake

.include <bsd.port.mk>
