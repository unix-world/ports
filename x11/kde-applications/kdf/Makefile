COMMENT =	KDE storage device statistics
DISTNAME =	kdf-${VERSION}
CATEGORIES =	x11 sysutils

HOMEPAGE =	https://kde.org/applications/system/org.kde.kdf

SHARED_LIBS +=  kdfprivate               3.0 # 18.12.0

WANTLIB += ${COMPILER_LIBCXX} GL KF6ColorScheme KF6Completion
WANTLIB += KF6ConfigCore KF6ConfigGui KF6ConfigWidgets KF6CoreAddons
WANTLIB += KF6Crash KF6GuiAddons KF6I18n KF6IconThemes KF6IconWidgets
WANTLIB += KF6JobWidgets KF6KCMUtils KF6KCMUtilsCore KF6KCMUtilsQuick
WANTLIB += KF6KIOCore KF6KIOGui KF6KIOWidgets KF6Notifications
WANTLIB += KF6Service KF6Solid KF6StatusNotifierItem KF6WidgetsAddons
WANTLIB += KF6XmlGui Qt6Core Qt6DBus Qt6Gui Qt6Network Qt6Qml
WANTLIB += Qt6Widgets Qt6Xml c m

MODKDE_DESKTOP_FILE = yes
MODKDE_ICON_CACHE = yes
MODKDE_TRANSLATIONS = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DOCS = yes

LIB_DEPENDS =	devel/kf6/kcmutils \
		devel/kf6/kcolorscheme \
		devel/kf6/kcompletion \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcoreaddons \
		devel/kf6/ki18n \
		devel/kf6/kguiaddons \
		devel/kf6/kiconthemes \
		devel/kf6/kio \
		devel/kf6/kcrash \
		devel/kf6/kjobwidgets \
		devel/kf6/knotifications \
		devel/kf6/kservice \
		devel/kf6/kstatusnotifieritem \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kxmlgui \
		devel/kf6/solid \
		x11/qt6/qtdeclarative

.include <bsd.port.mk>
