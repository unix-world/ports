COMMENT=		Brother P-touch CUPS driver

GH_TAGNAME=		v1.7.1
GH_ACCOUNT=		philpem
GH_PROJECT=		printer-driver-ptouch
DISTNAME=		ptouch-driver-${GH_TAGNAME:S/v//}

CATEGORIES=		print

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += c cups cupsimage m

BUILD_DEPENDS=		textproc/p5-XML-LibXML

# needed to build ptexplain which is not installed (hence no LDEP)
BUILD_DEPENDS +=	graphics/png

LIB_DEPENDS=		print/cups,-libs

# foomatic-rip(1), foomatic-db{,-engine}
RUN_DEPENDS +=		print/cups-filters

CONFIGURE_STYLE=	autoreconf
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=		libdir=${PREFIX}/libexec

# uses gnu89-inlines; fixes build with clang
CFLAGS +=		-fgnu89-inline

AUTOCONF_VERSION=	2.71
AUTOMAKE_VERSION=	1.16

USE_GMAKE=		Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/driver/ptouch-pt.xml

.include <bsd.port.mk>
