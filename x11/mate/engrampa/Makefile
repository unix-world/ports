USE_WXNEEDED=		Yes

COMMENT=		file archiver for the MATE desktop

CATEGORIES=		archivers

MATE_PROJECT=		engrampa
MATE_VERSION=		1.28.2

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 atk-bridge-2.0 c cairo cairo-gobject
WANTLIB += caja-extension epoxy expat ffi fontconfig freetype fribidi
WANTLIB += gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += graphite2 gthread-2.0 gtk-3 harfbuzz iconv intl json-glib-1.0
WANTLIB += m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1 png
WANTLIB += pthread xcb xcb-render xcb-shm z
WANTLIB += ${COMPILER_LIBCXX} ICE SM execinfo jpeg Xau Xdmcp
WANTLIB += atspi dbus-1 epoll-shim wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon

MODULES=		devel/dconf \
			x11/gnome

RUN_DEPENDS=		archivers/gtar \
			archivers/p7zip \
			archivers/unrar \
			archivers/unzip \
			archivers/zip

LIB_DEPENDS=		devel/json-glib \
			x11/mate/caja

CFLAGS_base-clang =	-Wno-error=int-conversion

CONFIGURE_ARGS=		--disable-packagekit

MODGNOME_TOOLS=		desktop-file-utils gtk-update-icon-cache yelp

CONFIGURE_STYLE=	gnu

.include <bsd.port.mk>
