COMMENT =		dbus bindings for Python

V =			1.4.0
DISTNAME =		dbus-python-${V}
EXTRACT_SUFX=		.tar.xz
PKGNAME =		py-dbus-${V}
REVISION =		0

CATEGORIES =		x11

HOMEPAGE =		http://dbus.freedesktop.org/

MAINTAINER =		Antoine Jacoutot <ajacoutot@openbsd.org>

# ISC-like
PERMIT_PACKAGE =	Yes

WANTLIB += dbus-1 glib-2.0

SITES =			http://dbus.freedesktop.org/releases/dbus-python/

MODULES =		devel/meson \
			lang/python

BUILD_DEPENDS =		devel/py-gobject3

LIB_DEPENDS =		devel/glib2 \
			x11/dbus

RUN_DEPENDS =		devel/py-gobject3 \
			x11/dbus

pre-configure:
	sed -i "s,/bin/bash,/bin/sh,g" \
		${WRKSRC}/test/{TestSuitePythonService.service.in,run-test.sh}

.include <bsd.port.mk>
