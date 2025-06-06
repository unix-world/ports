# qt6 webengine
USE_WXNEEDED =	Yes

COMMENT =	distraction-free Markdown editor

DISTNAME =	ghostwriter-${MODKDE_GEAR_VERSION}

CATEGORIES =	editors

HOMEPAGE =	https://ghostwriter.kde.org/

# GPLv3 code, CC BY-SA 4.0 resources
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} GL KF6ColorScheme KF6ConfigCore
WANTLIB += KF6ConfigGui KF6ConfigWidgets KF6CoreAddons KF6GuiAddons
WANTLIB += KF6SonnetCore KF6SonnetUi KF6WidgetsAddons KF6XmlGui
WANTLIB += Qt6Concurrent Qt6Core Qt6DBus Qt6Gui Qt6Network Qt6OpenGL
WANTLIB += Qt6Positioning Qt6PrintSupport Qt6Qml Qt6QmlMeta Qt6QmlModels
WANTLIB += Qt6QmlWorkerScript Qt6Quick Qt6Svg Qt6WebChannel Qt6WebEngineCore
WANTLIB += Qt6WebEngineWidgets Qt6Widgets Qt6Xml c m

SITES =	${SITE_KDE:=stable/release-service/${MODKDE_GEAR_VERSION}/src/}
EXTRACT_SUFX =	.tar.xz

MODULES =		x11/kde

RUN_DEPENDS =		devel/desktop-file-utils \
			x11/gtk+4,-guic

LIB_DEPENDS += 		devel/kf6/kcolorscheme \
			devel/kf6/kconfig \
			devel/kf6/kconfigwidgets \
			devel/kf6/kcoreaddons \
			devel/kf6/kwidgetsaddons \
			devel/kf6/kxmlgui \
			devel/kf6/sonnet \
			devel/kf6/kguiaddons \
			x11/qt6/qtdeclarative \
			x11/qt6/qtpositioning \
			x11/qt6/qtsvg \
			x11/qt6/qtwebchannel \
			x11/qt6/qtwebengine

NO_TEST =		Yes

.include <bsd.port.mk>
