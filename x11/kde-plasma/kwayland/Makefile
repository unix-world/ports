COMMENT =	Qt API to interact with the wayland-client and -server
DISTNAME =	kwayland-${VERSION}
PKGNAME =	kf6-kwayland-${VERSION}

SHARED_LIBS +=  KWaylandClient            0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Concurrent Qt6Core Qt6Gui
WANTLIB += Qt6WaylandClient m wayland-client wayland-cursor xkbcommon

BUILD_DEPENDS =		wayland/libinput-openbsd \
			wayland/plasma-wayland-protocols>=1.14.0 \
			wayland/wayland-protocols>=1.40

RUN_DEPENDS =		wayland/libinput-openbsd \
			wayland/plasma-wayland-protocols>=1.14.0 \
			wayland/wayland-protocols>=1.40

LIB_DEPENDS =		wayland/wayland \
			x11/qt6/qtwayland \
			x11/xkbcommon

# libinput
CXXFLAGS=		-I${LOCALBASE}/include

.include <bsd.port.mk>
