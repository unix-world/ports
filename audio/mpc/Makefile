COMMENT=		command line client for mpd

VER=			0.35
DISTNAME=		mpc-${VER}
CATEGORIES=		audio
EXTRACT_SUFX=		.tar.xz

HOMEPAGE=		https://www.musicpd.org/clients/mpc/

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB=		c iconv mpdclient

LIB_DEPENDS=		audio/libmpdclient>=2.2 \
			converters/libiconv

BUILD_DEPENDS +=	textproc/py-sphinx
SITES=			https://www.musicpd.org/download/mpc/${VER:R}/

MODULES=		devel/meson

CONFIGURE_ENV=		LDFLAGS="-L${LOCALBASE}/lib -liconv"

.include <bsd.port.mk>
