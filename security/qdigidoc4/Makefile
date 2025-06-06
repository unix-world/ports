COMMENT =		DigiDoc4 GUI client for signing and encrypting documents

PORTROACH =		skipv:4.6.1	# Windows-only
V =			4.7.0
DISTNAME =		qdigidoc4-${V}
CATEGORIES =		security x11
REVISION =		1

DEBUG_PACKAGES =	${BUILD_PACKAGES}

HOMEPAGE =		https://www.id.ee/

# LGPL 2.1+
PERMIT_PACKAGE =	Yes

DIST_SUBDIR =		qdigidoc4
SITES =			https://github.com/open-eid/DigiDoc4-Client/releases/download/v${V}/
DISTFILES =		new-{}${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY =		${DISTFILES:S/{}//}


SITES.eesti =		https://id.eesti.ee/
CONFIG_NAME =		config-20250321070515Z
# need to be in sync due to CONFIG_URL handling
.for _suffix in json pub rsa
DISTFILES.eesti +=	${CONFIG_NAME}{config}.${_suffix}
.endfor
# ${WRKSRC}/common/CMakeLists.txt itself substitutes suffix in CONFIG_URL
CONFIGURE_ENV +=	CONFIG_URL=file://${FULLDISTDIR}/${CONFIG_NAME}.json

SITES.eu =		https://ec.europa.eu/tools/lotl/
EU_V =			20250317
DISTFILES.eu =		eu-lotl-${EU_V}{eu-lotl}.xml
CONFIGURE_ENV +=	TSL_URL=file://${FULLDISTDIR}/eu-lotl-${EU_V}.xml

MAINTAINER =		Klemens Nanni <kn@openbsd.org>

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Core Qt6Gui Qt6Network Qt6PrintSupport
WANTLIB += Qt6Svg Qt6SvgWidgets Qt6Widgets c crypto digidocpp
WANTLIB += flatbuffers lber ldap m pcsclite ssl z

MODULES =		devel/cmake \
			x11/qt6

BUILD_DEPENDS =		devel/gettext,-tools

LIB_DEPENDS =		devel/flatbuffers \
			databases/openldap,-main \
			security/libdigidocpp>=4.1.0 \
			security/pcsc-lite \
			x11/qt6/qtsvg

RUN_DEPENDS =		devel/desktop-file-utils \
			misc/shared-mime-info \
			x11/qt6/qttranslations \
			x11/gtk+4,-guic

CONFIGURE_ENV +=	LDFLAGS=${LDFLAGS:Q}

# dlopen()'ed "opensc-pkcs11.so" in qdigidoc4
BUILD_DEPENDS +=	security/opensc
RUN_DEPENDS +=		security/opensc
CONFIGURE_ARGS +=	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} \
			    -Wl,-rpath,/usr/local/lib/pkcs11"

NO_TEST =		Yes

.include <bsd.port.mk>
