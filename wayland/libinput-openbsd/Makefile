# XXX
# libinput-openbsd is not feature complete that the input works
# in a usable way in Wayland. There is still too little experience here.
# In the following ports libinput detection was deactivated
# audio/pulseaudio
# devel/sdl2
# games/bzflag
# graphics/gimp/stable
# misc/brltty
# sysutils/consolekit
# wayland/libei
# x11/gnome/mutter
# x11/gtk+3 (-Dwayland-backend=false)
# x11/gtk+4 (-Dwayland-backend=false)
# x11/kde-applications/kdenlive (cmake patch)
# x11/kde-applications/krfb (cmake patch)
# x11/x11vnc

COMMENT =	wscons(4) and kqueue(2) based port of libinput

CATEGORIES =	x11 wayland

GH_ACCOUNT =	sizeofvoid
GH_PROJECT =	libopeninput
GH_COMMIT =	03349b6cdbd7048f1665694ecea7284934594e1a

DISTNAME =	libinput-openbsd-1.26.2
REVISION =	0

SHARED_LIBS =	input	0.1

WANTLIB += epoll-shim m udev

# BSD
PERMIT_PACKAGE =	Yes

MODULES =	devel/meson \
		lang/python

LIB_DEPENDS =	devel/epoll-shim \
		sysutils/libudev-openbsd

CONFIGURE_ARGS =	-Dlibwacom=false \
			-Ddocumentation=false

# XXX debugging
CFLAGS =		-O0 -g

DEBUG_PACKAGES =	${BUILD_PACKAGES}

.include <bsd.port.mk>
