COMMENT =	GNU binary utilities

DISTNAME =	binutils-2.44
EXTRACT_SUFX =	.tar.bz2

CATEGORIES =	devel

HOMEPAGE =	https://sourceware.org/binutils/

MAINTAINER =	Frederic Cambus <fcambus@openbsd.org>

# GPLv3+
PERMIT_PACKAGE =	Yes

COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

WANTLIB += c z zstd

LIB_DEPENDS +=	archivers/zstd

SITES =		${SITE_GNU:=binutils/}

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS +=	--disable-gprof \
			--disable-ld \
			--disable-libctf \
			--disable-nls \
			--disable-install-libbfd \
			--program-prefix=g \
			--without-msgpack \
			--with-system-zlib

USE_GMAKE =	Yes

post-install:
	@rm ${PREFIX}/info/bfd.info	# Installed by devel/gdb
	@rm -rf ${PREFIX}/*-unknown-openbsd${OSREV}

.include <bsd.port.mk>
