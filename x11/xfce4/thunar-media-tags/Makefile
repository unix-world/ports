COMMENT=	Thunar media tags plugin

XFCE_VERSION=	0.5.0
THUNAR_PLUGIN=	thunar-media-tags-plugin

# GPLv3
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4
MODXFCE_PURGE_LA =	lib/thunarx-3

WANTLIB=	X11 Xcomposite Xcursor Xdamage Xext fribidi \
		Xfixes Xi Xinerama Xrandr Xrender atk-1.0 cairo \
		expat fontconfig freetype gdk-3 gdk_pixbuf-2.0 \
		gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 \
		gtk-3 m pango-1.0 pangocairo-1.0 pangoft2-1.0 \
		pcre2-8 pixman-1 png ${COMPILER_LIBCXX} z xcb ffi xfce4util \
		thunarx-3 tag tag_c xcb-render xcb-shm \
		atk-bridge-2.0 cairo-gobject epoxy fribidi \
		harfbuzz pthread graphite2 iconv intl
WANTLIB += Xau Xdmcp jpeg atspi dbus-1
WANTLIB += epoll-shim wayland-client wayland-cursor wayland-egl
WANTLIB += xkbcommon

LIB_DEPENDS=	x11/xfce4/thunar>=1.7.0 \
		audio/taglib
COMPILER =		base-clang ports-gcc base-gcc

.include <bsd.port.mk>
