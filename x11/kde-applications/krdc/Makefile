BROKEN = Depends on FreeRDP3

COMMENT =	VNC and RDP  desktop client
DISTNAME =	krdc-${VERSION}
CATEGORIES =	net x11

SHARED_LIBS +=  krdccore               3.1 # 5.0

HOMEPAGE =	https://kde.org/applications/internet/org.kde.krdc

WANTLIB += ${COMPILER_LIBCXX} GL KF6Bookmarks KF6BookmarksWidgets
WANTLIB += KF6ColorScheme KF6Completion KF6ConfigCore KF6ConfigGui
WANTLIB += KF6ConfigWidgets KF6CoreAddons KF6Crash KF6DNSSD KF6GuiAddons
WANTLIB += KF6I18n KF6IconThemes KF6JobWidgets KF6KCMUtils KF6KCMUtilsCore
WANTLIB += KF6KCMUtilsQuick KF6KIOCore KF6KIOGui KF6KIOWidgets
WANTLIB += KF6Notifications KF6NotifyConfig KF6Service KF6Solid
WANTLIB += KF6StatusNotifierItem KF6Wallet KF6WidgetsAddons KF6WindowSystem
WANTLIB += KF6XmlGui PlasmaActivities Qt6Core Qt6DBus Qt6Gui Qt6Network
WANTLIB += Qt6Qml Qt6WaylandClient Qt6Widgets Qt6Xml X11 c freerdp-client2
WANTLIB += freerdp2 m sndio ssh vncclient wayland-client wayland-cursor
WANTLIB += winpr2 xkbcommon

MODKDE_DESKTOP_FILE = yes
MODKDE_TRANSLATIONS = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DOCS = yes

RUN_DEPENDS +=	misc/shared-mime-info

LIB_DEPENDS =	devel/kf6/kbookmarks \
		devel/kf6/kcmutils \
		devel/kf6/kcolorscheme \
		devel/kf6/kcompletion \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcoreaddons \
		devel/kf6/kdnssd \
		devel/kf6/ki18n \
		devel/kf6/kiconthemes \
		devel/kf6/kguiaddons \
		devel/kf6/kio \
		devel/kf6/kjobwidgets \
		devel/kf6/knotifications \
		devel/kf6/knotifyconfig \
		devel/kf6/kservice \
		devel/kf6/kstatusnotifieritem \
		devel/kf6/kwallet \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kwindowsystem \
		devel/kf6/kxmlgui \
		devel/kf6/solid \
		devel/kf6/kcrash \
		net/libvncserver \
		security/libssh \
		wayland/wayland \
		x11/freerdp \
		x11/kde-plasma/plasma-activities \
		x11/qt6/qtdeclarative \
		x11/qt6/qtwayland \
		x11/xkbcommon \

.include <bsd.port.mk>
