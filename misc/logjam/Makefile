COMMENT =	GTK client for LiveJournal

DISTNAME =	logjam-4.6.2
REVISION =	7
CATEGORIES =	misc x11

HOMEPAGE =	http://andy-shev.github.com/LogJam/

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} X11 Xcomposite Xcursor Xdamage Xext
WANTLIB += Xfixes Xi Xinerama Xrandr Xrender atk-1.0 brotlicommon
WANTLIB += brotlidec c cairo dbus-1 dbus-glib-1 expat ffi fontconfig
WANTLIB += freetype fribidi gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 graphite2 gthread-2.0
WANTLIB += gtk-x11-2.0 harfbuzz iconv idn2 intl lzma m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1 png psl soup-2.4
WANTLIB += sqlite3 unistring xcb xcb-render xcb-shm xml2 z
WANTLIB += Xau Xdmcp jpeg

SITES =		${HOMEPAGE}/download/
EXTRACT_SUFX =	.tar.bz2

MODULES =	textproc/intltool


LIB_DEPENDS =	devel/libsoup \
		textproc/libxml \
		x11/dbus-glib \
		x11/gtk+2

RUN_DEPENDS =	devel/desktop-file-utils

USE_GMAKE =		Yes
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--with-libsoup \
			--with-sqlite3 \
			--without-librsvg \
			--without-gtkspell \
			--without-gtkhtml314 \
			--without-banshee

CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
