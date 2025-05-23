# no RCS Id here, please

ONLY_FOR_ARCHS-mono=	${MONO_ARCHS}

COMMENT-main=	framework for Multicast DNS Service Discovery
COMMENT-gtk=	gtk+2 avahi-ui libraries
COMMENT-gtk3=	gtk+3 avahi-ui libraries
COMMENT-gui=	GUI client utilities for avahi
COMMENT-mono=	mono (.NET) bindings for avahi
COMMENT-qt3=	qt3 bindings for avahi
COMMENT-qt4=	qt4 bindings for avahi
COMMENT-ui=	common avahi-ui header for gtk+2 and gtk+3

V=		0.6.31
DISTNAME=	avahi-${V}
CATEGORIES=	net devel portcheck

PKGNAME-main=	avahi-${V}
PKGNAME-gtk=	avahi-gtk-${V}
PKGNAME-gtk3=	avahi-gtk3-${V}
PKGNAME-gui=	avahi-gui-${V}
PKGNAME-mono=	mono-avahi-${V}
PKGNAME-qt3=	avahi-qt3-${V}
PKGNAME-qt4=	avahi-qt4-${V}
PKGNAME-ui=	avahi-ui-${V}

PKG_ARCH-ui=	*

REVISION-main=	10
REVISION-gtk=	5
REVISION-mono=	2
REVISION-qt3=	2
REVISION-qt4=	3
REVISION-ui=	3

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

SHARED_LIBS +=  avahi-common         0.0      # .8.0
SHARED_LIBS +=  avahi-core           0.0      # .5.5
SHARED_LIBS +=  avahi-client         5.0      # .5.4
SHARED_LIBS +=  avahi-glib           0.3      # .1.1
SHARED_LIBS +=  avahi-gobject        0.0      # .0.1
   SHARED_LIBS +=  howl                 9.9  \
		dns_sd               0.0      # .1.0

HOMEPAGE=	http://www.avahi.org/

# LGPLv2.1
PERMIT_PACKAGE=	Yes

SITES=		${HOMEPAGE}/download/

PSEUDO_FLAVORS=	no_gui no_mono no_qt3 no_qt4 bootstrap
FLAVOR?=	no_gui no_mono no_qt3 no_qt4 bootstrap

MULTI_PACKAGES=	-main -mono -qt3 -qt4 -gui -gtk -gtk3 -ui

MODULES=	textproc/intltool

BUILD_DEPENDS=	converters/xmltoman \
		devel/gobject-introspection

WANTLIB-main=	c expat glib-2.0 gobject-2.0 pcre pthread \
		gdbm daemon dbus-1 ffi
LIB_DEPENDS-main= devel/glib2 \
		databases/gdbm \
		devel/libdaemon>=0.14 \
		x11/dbus

.include <bsd.port.arch.mk>

.if !${BUILD_PACKAGES:M-gui}
# all these vanish together
BUILD_PACKAGES := ${BUILD_PACKAGES:N-mono:N-gtk:N-gtk3:N-ui}
.endif

WANTLIB-mono=	# empty
.if ${BUILD_PACKAGES:M-mono}
MODULES+=	lang/mono
BUILD_DEPENDS+=	${MODMONO_BUILD_DEPENDS} \
		x11/mono-gtk2
RUN_DEPENDS-mono= ${MODMONO_RUN_DEPENDS} \
		${BUILD_PKGPATH},-gtk \
		x11/mono-gtk2
LIB_DEPENDS-mono= # empty
.else
CONFIGURE_ARGS+= --disable-mono \
		--disable-monodoc
.endif

WANTLIB-gtk=	X11 Xcomposite Xcursor Xdamage Xext Xfixes \
		Xi Xinerama Xrandr Xrender atk-1.0 cairo dbus-1 \
		expat fontconfig freetype gdbm gdk-x11-2.0 gthread-2.0 \
		gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 \
		gobject-2.0 gtk-x11-2.0 m pango-1.0 pangocairo-1.0 \
		pangoft2-1.0 pcre pixman-1 png pthread pthread-stubs xcb z \
		xcb-render avahi-client avahi-common xcb-shm \
		avahi-glib ffi harfbuzz graphite2

WANTLIB-gtk3 += X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB-gtk3 += Xi Xinerama Xrandr Xrender atk-1.0 avahi-client
WANTLIB-gtk3 += avahi-common avahi-glib cairo cairo-gobject
WANTLIB-gtk3 += dbus-1 expat fontconfig freetype gdbm gdk-3 gdk_pixbuf-2.0
WANTLIB-gtk3 += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB-gtk3 += gtk-3 m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB-gtk3 += pcre pixman-1 png pthread pthread-stubs xcb xcb-render
WANTLIB-gtk3 += xcb-shm z ffi
WANTLIB-gtk3 += ICE SM atk-bridge-2.0 atspi harfbuzz
WANTLIB-gtk3 += graphite2

WANTLIB-gui += X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB-gui += Xi Xinerama Xrandr Xrender atk-1.0 avahi-client
WANTLIB-gui += avahi-common avahi-core avahi-glib avahi-ui-gtk3 c
WANTLIB-gui += cairo cairo-gobject dbus-1 expat fontconfig freetype
WANTLIB-gui += gdbm gdk-3 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB-gui += gobject-2.0 gthread-2.0 gtk-3 m pango-1.0
WANTLIB-gui += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB-gui += pthread-stubs xcb xcb-render xcb-shm z ffi
WANTLIB-gui += ICE SM atk-bridge-2.0 atspi harfbuzz
WANTLIB-gui += graphite2

WANTLIB-ui= # empty

.if ${BUILD_PACKAGES:M-gui}
### common
MODULES+=	lang/python
BUILD_DEPENDS+=	lang/python/${MODPY_VERSION},-gdbm \
		x11/py-gtk2 \
		x11/dbus-python

### -gtk
SHARED_LIBS +=  avahi-ui             0.0      # .1.0
LIB_DEPENDS-gtk= x11/gtk+2 \
		${BUILD_PKGPATH}
RUN_DEPENDS-gtk= ${BUILD_PKGPATH},-ui

### -gtk3
SHARED_LIBS +=  avahi-ui-gtk3             0.0 # 1.4
LIB_DEPENDS-gtk3= x11/gtk+3 \
		${BUILD_PKGPATH}
RUN_DEPENDS-gtk3= ${BUILD_PKGPATH},-ui

### -gui
LIB_DEPENDS-gui= ${BUILD_PKGPATH},-gtk3
RUN_DEPENDS-gui= ${MODPY_RUN_DEPENDS} \
		lang/python/${MODPY_VERSION},-gdbm \
		x11/py-gtk2 \
		x11/dbus-python \
		devel/py-twisted/web \
		devel/desktop-file-utils

### -ui
LIB_DEPENDS-ui= # empty
RUN_DEPENDS-ui= ${BUILD_PKGPATH}
.else
CONFIGURE_ARGS+= --disable-gtk \
		--disable-gtk3 \
		--disable-python \
		--disable-pygtk \
		--disable-python-dbus

.endif

WANTLIB-qt3=	GL ICE SM X11 Xcursor Xext Xfixes Xft Xi \
		Xinerama Xmu Xrandr Xrender Xt expat fontconfig \
		freetype jpeg lcms m mng png pthread xcb z \
		avahi-common ${COMPILER_LIBCXX} ${MODQT3_WANTLIB} \
		Xdamage Xxf86vm drm pthread-stubs

.if ${BUILD_PACKAGES:M-qt3}
SHARED_LIBS +=  avahi-qt3            0.0      # .1.2
MODULES+=	x11/qt3
LIB_DEPENDS-qt3= ${MODQT3_LIB_DEPENDS} \
		${BUILD_PKGPATH}
.else
CONFIGURE_ARGS+= --disable-qt3
.endif

WANTLIB-qt4=	QtCore avahi-common m ${COMPILER_LIBCXX} \
		pthread

.if ${BUILD_PACKAGES:M-qt4}
SHARED_LIBS +=  avahi-qt4            0.0      # .1.2
MODULES+=	x11/qt4
LIB_DEPENDS-qt4= x11/qt4 \
		${BUILD_PKGPATH}
.else
CONFIGURE_ARGS+= --disable-qt4
.endif

USE_GMAKE=	Yes

MODPY_RUNDEP=	No
MODMONO_DEPS=	No

CFLAGS+=	-D_BSD_SOURCE

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib" \
		PTHREAD_CFLAGS="-pthread" \
		PTHREAD_LIBS="-pthread" \
		PYTHON="${MODPY_BIN}"
CONFIGURE_ARGS+=--with-dbus-sys="${SYSCONFDIR}/dbus-1/" \
		--with-avahi-user=_avahi \
		--with-avahi-group=_avahi \
		--with-avahi-priv-access-group=wheel \
		--with-xml=expat \
		--with-distro=none \
		--enable-compat-howl \
		--enable-compat-libdns_sd \
		--enable-core-docs \
		--enable-tests \
		--enable-introspection \
		--disable-autoipd \
		--disable-doxygen-doc \
		--disable-doxygen-dot \
		--disable-doxygen-xml \
		--disable-doxygen-html

# don't link with libssp from the gcc4 port
# __guard and __stack_smash_handler are part of libc
CONFIGURE_ARGS+=--disable-stack-protector

FAKE_FLAGS=	SYSCONFDIR=${SYSCONFDIR}

PC_FILES=	avahi-ui.pc avahi-client.pc avahi-compat-howl.pc \
		avahi-compat-libdns_sd.pc avahi-core.pc avahi-glib.pc \
		avahi-gobject.pc avahi-qt3.pc avahi-qt4.pc

pre-configure:
	find ${WRKSRC} -name Makefile.in -exec \
		perl -pi -e 's,LIBINTL,INTLLIBS,g;' \
			-e 's,LIBICONV,LTLIBICONV,g' {} \;
	find ${WRKSRC}/man -name '*.[1-9]*' | xargs \
		perl -pi -e 's,/etc/avahi,${SYSCONFDIR}/avahi,g'
	perl -pi -e 's,dbus_connection_disconnect,dbus_connection_close,g' \
		${WRKSRC}/avahi-client/client.c \
		${WRKSRC}/avahi-daemon/dbus-protocol.c
	perl -pi -e 's,-ldl,,g' ${WRKSRC}/configure \
		${WRKSRC}/avahi-client/Makefile.in \
		${WRKSRC}/avahi-daemon/Makefile.in
	for i in ${PC_FILES}; do \
		perl -pi -e 's,Libs:,Libs: -pthread,;' \
			-e 's,Cflags:,Cflags: -pthread,' ${WRKSRC}/$${i}.in; done

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples
	mv ${WRKINST}${SYSCONFDIR}/dbus-1 ${PREFIX}/share/examples/
	mv ${WRKINST}${SYSCONFDIR}/avahi ${PREFIX}/share/examples/
	# Install the dbus system-service, some applications needs it to
	# know that avahi-daemon is running.
	${INSTALL_DATA_DIR} ${PREFIX}/share/dbus-1/system-services
	${INSTALL_DATA} ${WRKBUILD}/avahi-daemon/org.freedesktop.Avahi.service \
		${PREFIX}/share/dbus-1/system-services
	# XXX DLLMAP_FILES won't work here since the files are generated during the build process
	find ${PREFIX} -name avahi-sharp.dll.config -or -name avahi-ui-sharp.dll.config | \
		xargs perl -pi -e 's,\.so(\.[0-9])+,\.so,g'

.include <bsd.port.mk>
