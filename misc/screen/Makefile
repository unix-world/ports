COMMENT=	multi-screen window manager

DISTNAME=	screen-5.0.1
PKGNAME=	screen-5.0.1.2
DISTFILES=	${DISTNAME}-2{${DISTNAME}}.tar.gz
CATEGORIES=	misc
SITES=		${SITE_GNU:=screen/}

HOMEPAGE=	https://www.gnu.org/software/screen/

# GPLv3+
PERMIT_PACKAGE=	Yes

# C17
COMPILER=	base-clang ports-gcc
COMPILER_LANGS=	c

CONFIGURE_STYLE= gnu
CONFIGURE_ARGS=	--with-sys-screenrc="${SYSCONFDIR}/screenrc" --disable-pam

USE_GMAKE=	Yes
USE_GROFF=	Yes

FLAVORS=	static
FLAVOR?=

.if ${FLAVOR} == "static"
CONFIGURE_ENV=	LDFLAGS="${STATIC}"
.else
WANTLIB=	c curses util
.endif

ALL_TARGET=	screen screen.info
#MAKE_FLAGS=	OPTIONS=-DDEBUG
DEBUG_PACKAGES=	${BUILD_PACKAGES}

pre-build:
	${SUBST_CMD} ${WRKSRC}/doc/screen.1

# XXX unclean distfile
post-extract:
	cd ${WRKSRC}; \
	rm -f screen.o acls.o ansi.o attacher.o backtick.o canvas.o comm.o display.o encoding.o fileio.o help.o input.o kmapdef.o layer.o layout.o list_display.o list_generic.o list_license.o list_window.o logfile.o mark.o misc.o process.o pty.o resize.o sched.o search.o socket.o telnet.o term.o termcap.o tty.o utmp.o viewport.o window.o winmsg.o winmsgbuf.o winmsgcond.o screen config.status Makefile doc/Makefile term.h comm.h kmapdef.c config.h; \
	rm -r autom4te.cache


post-install:
	cd ${PREFIX}/bin && mv -f screen-* screen
	chmod 755 ${PREFIX}/bin/screen
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/screen
	${INSTALL_DATA} ${WRKSRC}/etc/etcscreenrc \
		${PREFIX}/share/examples/screen/screenrc

.include <bsd.port.mk>
