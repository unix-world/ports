COMMENT =	global desktop keyboard shortcuts for KDE
DISTNAME =	kglobalaccel-${VERSION}

SHARED_LIBS +=  KF6GlobalAccel            0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Core Qt6DBus Qt6Gui Qt6Widgets
WANTLIB += m xkbcommon

LIB_DEPENDS = x11/xkbcommon

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
