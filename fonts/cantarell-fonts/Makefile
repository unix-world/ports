COMMENT=		humanist sans-serif font family

GNOME_VERSION=		0.303.1
GNOME_PROJECT=		cantarell-fonts
REVISION=		0

CATEGORIES=		fonts x11

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# SIL OFL 1.1
PERMIT_PACKAGE=		Yes

MODULES=		devel/meson \
			x11/gnome

PKG_ARCH=		*

# use pre-built font binaries; otherwise we would need psautohint
CONFIGURE_ARGS=		-Duseprebuilt=true

.include <bsd.port.mk>
