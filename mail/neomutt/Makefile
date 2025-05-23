COMMENT=	tty-based e-mail client, forked from Mutt

GH_ACCOUNT=	neomutt
GH_PROJECT=	neomutt
GH_TAGNAME=	20250510

DIST_TUPLE=	github neomutt neomutt-test-files \
		7404f4423b11cd5da2d123b3636c7a310bbbed9f neomutt-test-files

CATEGORIES=	mail
HOMEPAGE=	https://neomutt.org/

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

EPOCH=		0

# GPLv2+
PERMIT_PACKAGE=	Yes

COMPILER=	base-clang ports-gcc
COMPILER_LANGS=	c

# uses pledge()
WANTLIB+=	c crypto curses iconv idn2 intl pcre2-8 ssl tdb z

LIB_DEPENDS+=	databases/tdb \
		devel/gettext,-runtime \
		devel/libidn2 \
		devel/pcre2
BUILD_DEPENDS+=	devel/gettext,-tools \
		lang/jimtcl \
		textproc/docbook-xsl \
		w3m-*|lynx-*:www/lynx
DEBUG_PACKAGES=	${BUILD_PACKAGES}

FLAVORS=	gpgme sasl notmuch
FLAVOR?=

CONFIGURE_STYLE= simple
CONFIGURE_ARGS+= --mandir="${PREFIX}/man" \
		--with-ui=ncurses \
		--docdir="${PREFIX}/share/doc/neomutt" \
		--with-lock=flock \
		--idn2 \
		--fmemopen \
		--pcre2 \
		--ssl \
		--tdb \
		--zlib \
		--debug

CONFIGURE_ENV=	autosetup_tclsh="${LOCALBASE}/bin/jimsh" \
		CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
		CCACHE=none \
		LDFLAGS="-L${LOCALBASE}/lib"

SYSCONFDIR=	${BASESYSCONFDIR}/mutt
FAKE_FLAGS=	sysconfdir="${PREFIX}/share/examples/neomutt"
TEST_FLAGS=	NEOMUTT_TEST_DIR=${WRKSRC}/neomutt-test-files
FIX_CLEANUP_PERMISSIONS= Yes

.if ${FLAVOR:Mgpgme}
CONFIGURE_ARGS+= --autocrypt \
		--gpgme \
		--sqlite
LIB_DEPENDS+=	databases/sqlite3 \
		security/gpgme
WANTLIB+=	gpg-error gpgme sqlite3
.endif

.if ${FLAVOR:Msasl}
CONFIGURE_ARGS+= --sasl
LIB_DEPENDS+=	security/cyrus-sasl2
WANTLIB+=	sasl2
.endif

.if ${FLAVOR:Mnotmuch}
CONFIGURE_ARGS+= --notmuch
LIB_DEPENDS+=	mail/notmuch,-main
WANTLIB+=	notmuch
.endif

.include <bsd.port.arch.mk>
.if ${MACHINE_ARCH} != hppa
LIB_DEPENDS+=  databases/kyotocabinet
WANTLIB+=      kyotocabinet
CONFIGURE_ARGS+= --kyotocabinet
.endif

pre-test:
	cd ${WRKSRC}/neomutt-test-files; ./setup.sh

.include <bsd.port.mk>
