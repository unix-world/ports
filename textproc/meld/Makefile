COMMENT=		graphical diff and merge tool

GNOME_VERSION=		3.22.2
GNOME_PROJECT=		meld
REVISION=		2

CATEGORIES=		textproc

HOMEPAGE=		http://meldmerge.org/

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=		devel/dconf \
			devel/meson \
			lang/python \
			x11/gnome

MODPY_ADJ_FILES=	bin/meld

MODGNOME_TOOLS=		desktop-file-utils gtk-update-icon-cache \
			shared-mime-info yelp

BUILD_DEPENDS=		devel/py-gobject3 \
			x11/gtk+3 \
			x11/gtksourceview4

RUN_DEPENDS=		devel/py-gobject3 \
			x11/gtk+3 \
			x11/gtksourceview4

# org.gnome.desktop.interface
RUN_DEPENDS +=		devel/gsettings-desktop-schemas

.include <bsd.port.mk>
