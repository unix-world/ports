# ppc: firefox-esr/thunderbird xpcshell segfaults during startup compilation
# ppc: seamonkey/firefox - failure to link for atomic ops on 64 bits
# gcc does ICE on alpha at some particular spots:
# thunderbird-24.0/comm-esr24/mozilla/js/src/vm/Debugger.cpp:3246
# firefox-24.0/mozilla-release/js/src/frontend/BytecodeEmitter.cpp:1488
# seamonkey-2.22/comm-release/mozilla/js/src/vm/Interpreter.cpp:743
# firefox-25.0/mozilla-release/js/src/builtin/MapObject.cpp:1119

.if ${MACHINE_ARCH} == "i386"
MAKE_ENV +=		RUSTFLAGS="-C target-cpu=pentium4 --cfg target_feature=\"sse2\""
# reduce build memory usage:
CONFIGURE_ARGS +=	--disable-debug-symbols
DPB_PROPERTIES +=	lonesome
.else
DPB_PROPERTIES +=	parallel
.endif

.for _lib in ${MOZILLA_LIBS}
SHARED_LIBS +=	${_lib}	${SO_VERSION}
.endfor

PKGNAME ?=	${MOZILLA_PROJECT}-${MOZILLA_VERSION:S/b/beta/}

MAINTAINER ?=	Landry Breuil <landry@openbsd.org>

MOZILLA_DIST ?=	${MOZILLA_PROJECT}
MOZILLA_DIST_VERSION ?=	${MOZILLA_VERSION:C/rc.//}
MOZILLA_MAJOR_VERSION =${MOZILLA_VERSION:C/\..*//}

.if ${MOZILLA_VERSION:M*rc?}
SITES ?=	https://ftp.mozilla.org/pub/${MOZILLA_DIST}/candidates/${MOZILLA_DIST_VERSION}-candidates/build${MOZILLA_VERSION:C/.*(.)/\1/}/source/
# first is the CDN and only has last releases
# ftp.m.o has all the betas/candidate builds but should only be used as fallback
.else
SITES ?=	https://releases.mozilla.org/pub/${MOZILLA_DIST}/releases/${MOZILLA_DIST_VERSION}/source/ \
		https://ftp.mozilla.org/pub/${MOZILLA_DIST}/releases/${MOZILLA_DIST_VERSION}/source/
.endif

.if defined(MOZILLA_COMMIT) && defined(MOZILLA_BRANCH)
DISTNAME =	${MOZILLA_DIST}-${MOZILLA_DIST_VERSION}
DISTFILES ?=	${MOZILLA_DIST}-${MOZILLA_DIST_VERSION}${EXTRACT_SUFX}{${MOZILLA_COMMIT}${EXTRACT_SUFX}}
WRKDIST =	${WRKDIR}/mozilla-${MOZILLA_BRANCH}-${MOZILLA_COMMIT}
SITES ?=	https://hg.mozilla.org/releases/mozilla-${MOZILLA_BRANCH}/archive/
EXTRACT_SUFX =	.tar.bz2
MODMOZILLA_pre-configure+= \
	cp ${WRKSRC}/${CONFIGURE_SCRIPT}.in ${WRKSRC}/${CONFIGURE_SCRIPT}; \
	cp ${WRKSRC}/js/src/${CONFIGURE_SCRIPT}.in ${WRKSRC}/js/src/${CONFIGURE_SCRIPT}; \
	chmod +x ${WRKSRC}/${CONFIGURE_SCRIPT}
.endif

DISTNAME ?=	${MOZILLA_DIST}-${MOZILLA_DIST_VERSION}.source
EXTRACT_SUFX ?=	.tar.xz
DIST_SUBDIR ?=	mozilla

.if defined(MOZILLA_PROFDATA_TASKID)
.if ${MOZILLA_PROJECT:Mfirefox}
DISTFILES.profdata =	${DISTNAME}-profdata-repacked-16${EXTRACT_SUFX}
SITES.profdata =	https://rhaalovely.net/stuff/
.else
DISTFILES.profdata =	${DISTNAME}-profdata${EXTRACT_SUFX}{profdata${EXTRACT_SUFX}}
SITES.profdata =	https://firefox-ci-tc.services.mozilla.com/api/queue/v1/task/${MOZILLA_PROFDATA_TASKID}/runs/0/artifacts/public/build/
.endif
CONFIGURE_ARGS +=	--enable-profile-use
CONFIGURE_ARGS +=	--with-pgo-profile-path=${WRKDIR}/merged.profdata
.endif

MODMOZ_RUN_DEPENDS =	devel/desktop-file-utils \
			x11/gtk+4,-guic
MODMOZ_BUILD_DEPENDS =	archivers/gtar \
			archivers/unzip \
			archivers/zip>=2.3

.if !defined(MOZILLA_USE_BUNDLED_NSS)
MODMOZ_LIB_DEPENDS +=	security/nss>=3.106
MODMOZ_WANTLIB +=	nss3 nssutil3 smime3 ssl3
CONFIGURE_ARGS +=	--with-system-nss
.endif

.if !defined(MOZILLA_USE_BUNDLED_NSPR)
MODMOZ_LIB_DEPENDS +=	devel/nspr>=4.36
MODMOZ_WANTLIB +=	nspr4 plc4 plds4
CONFIGURE_ARGS +=	--with-system-nspr
.endif

.if !defined(MOZILLA_USE_BUNDLED_ICU)
MODMOZ_LIB_DEPENDS +=	textproc/icu4c>=73.2p0
MODMOZ_WANTLIB +=	icudata icui18n icuuc
CONFIGURE_ARGS +=	--with-system-icu
.endif

.if !defined(MOZILLA_USE_BUNDLED_FFI)
MODMOZ_LIB_DEPENDS +=	devel/libffi
MODMOZ_WANTLIB +=	ffi
CONFIGURE_ARGS +=	--with-system-ffi
.endif

.if defined(MOZILLA_USE_SYSTEM_AV1)
MODMOZ_LIB_DEPENDS +=	multimedia/dav1d
MODMOZ_LIB_DEPENDS +=	multimedia/aom
MODMOZ_WANTLIB +=	aom dav1d
CONFIGURE_ARGS +=	--with-system-av1
.endif

.if !defined(MOZILLA_USE_DBUS)
CONFIGURE_ARGS +=	--disable-dbus
.else
# filepickers via portals need dbus
MODMOZ_LIB_DEPENDS +=	x11/dbus
MODMOZ_WANTLIB +=	dbus-1
CONFIGURE_ARGS +=	--enable-dbus
.endif

# bug #736961
SEPARATE_BUILD =	Yes

.if ${MACHINE_ARCH:Mi386} || ${MACHINE_ARCH:Mamd64}
.if ${MOZILLA_PROJECT} == "seamonkey"
# needed for webm/jpeg/vpx ?
MODMOZ_BUILD_DEPENDS +=	devel/yasm
.endif
# needed for dav1d since 67
MODMOZ_BUILD_DEPENDS +=	devel/nasm
.endif

# 53 needs rust
MODULES +=		lang/rust
MODMOZ_WANTLIB +=	${MODRUST_WANTLIB}
#1670807
MODMOZ_BUILD_DEPENDS +=	devel/m4

MODMOZ_WANTLIB +=	X11 X11-xcb Xcomposite Xcursor Xdamage Xext Xfixes Xi Xrender \
			atk-1.0 c cairo fontconfig freetype gdk_pixbuf-2.0 \
			gio-2.0 glib-2.0 gobject-2.0 harfbuzz intl m \
			pango-1.0 pangocairo-1.0 sndio z xcb xcb-shm
MODMOZ_WANTLIB +=	${COMPILER_LIBCXX}

WANTLIB +=	${MODMOZ_WANTLIB}
BUILD_DEPENDS +=${MODMOZ_BUILD_DEPENDS}
LIB_DEPENDS +=	${MODMOZ_LIB_DEPENDS}
RUN_DEPENDS +=	${MODMOZ_RUN_DEPENDS}

USE_GMAKE ?=	Yes

#1626955 & #510629
USE_NOBTCFI ?=	Yes

# no --with-system-jpeg starting with fx 18, requires libjpeg-turbo because of bug 791305
# no --with-system-cairo, removed in #1432751
# no --with-system-png, apng support not bundled in
# no --with-system-sqlite, option removed in #1611386 and we need to use bundled sqlite which has SQLITE_ENABLE_FTS3_TOKENIZER (#1252937)
# no --with-system-dav1d, cf #1493397 comment 12
# no --enable-system-hunspell, removed in #1460600

AUTOCONF_VERSION =	2.13
CONFIGURE_ARGS +=	--with-system-zlib	\
		--enable-official-branding	\
		--enable-optimize="${CFLAGS}"	\
		--disable-tests			\
		--disable-updater

# firefox >= 46 defaults to gtk+3
CONFIGURE_ARGS +=	--enable-default-toolkit=cairo-gtk3
MODMOZ_LIB_DEPENDS +=	x11/gtk+3
MODMOZ_WANTLIB +=	cairo-gobject gdk-3 gtk-3

PORTHOME =	${WRKSRC}

# from browser/config/mozconfig
.if ${MOZILLA_CODENAME:Mcomm*}
CONFIGURE_ARGS +=--enable-application=${MOZILLA_CODENAME}
.else
#1801738
CONFIGURE_ARGS +=--enable-project=${MOZILLA_CODENAME}
.endif

WRKDIST ?=	${WRKDIR}/${MOZILLA_DIST}-${MOZILLA_DIST_VERSION}

# needed for PLIST
MOZILLA_VER =	${MOZILLA_VERSION:C/b[0-9]*//:C/esr//:C/rc.$//}
SUBST_VARS +=	MOZILLA_PROJECT MOZILLA_VER MOZILLA_VERSION

MAKE_ENV +=	MOZILLA_OFFICIAL=1 \
		MOZ_APP_REMOTINGNAME=${MOZILLA_PROJECT} \
		SHELL=/bin/sh \
		SO_VERSION="${SO_VERSION}" \
		LLVM_CONFIG="${LOCALBASE}/bin/llvm-config-${MODCLANG_VERSION}"

CONFIGURE_ENV +=	${MAKE_ENV}
# ensure libffi's configure doesnt pick gsed/gmkdir/gawk
CONFIGURE_ENV +=	ac_cv_path_ax_enable_builddir_sed=/usr/bin/sed
CONFIGURE_ENV +=	ac_cv_path_SED=/usr/bin/sed
CONFIGURE_ENV +=	ac_cv_path_mkdir=/bin/mkdir
CONFIGURE_ENV +=	ac_cv_prog_AWK=/usr/bin/awk
CONFIGURE_ENV +=	AWK=/usr/bin/awk
CONFIGURE_ENV +=	M4=/usr/local/bin/gm4
