COMMENT=	Xfce4 mpd client panel plugin

XFCE_VERSION=	0.5.5
XFCE_PLUGIN=	mpc

# BSD-ISC
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4

CONFIGURE_ARGS=	--without-libmpd

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 cairo expat fontconfig pcre2-8 fribidi
WANTLIB += freetype gdk_pixbuf-2.0 gio-2.0 glib-2.0
WANTLIB += gmodule-2.0 gobject-2.0 m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pixman-1 png
WANTLIB += xcb xcb-render xcb-shm xfce4util z xcb-util xfce4ui-2
WANTLIB += ICE SM X11-xcb ffi startup-notification-1
WANTLIB += harfbuzz pthread graphite2 iconv intl
WANTLIB += atk-bridge-2.0 cairo-gobject epoxy gdk-3 gtk-3
WANTLIB += Xau Xdmcp jpeg atspi dbus-1 gthread-2.0 xfconf-0
WANTLIB += epoll-shim gtk-layer-shell wayland-client wayland-cursor
WANTLIB += wayland-egl xkbcommon ${COMPILER_LIBCXX}

.include <bsd.port.mk>
