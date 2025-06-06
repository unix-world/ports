USE_WXNEEDED =	Yes

COMMENT =	virtual globe and world atlas
DISTNAME =	marble-${VERSION}
CATEGORIES =	geo

HOMEPAGE =	https://marble.kde.org/

SHARED_LIBS +=  astro                     3.0
SHARED_LIBS +=  marblewidget-qt6          5.0

MODKDE_DESKTOP_FILE = yes
MODKDE_ICON_CACHE = yes
MODKDE_TRANSLATIONS = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes
MODKDE_DOCS = yes

WANTLIB += ${COMPILER_LIBCXX} GL KF6ColorScheme KF6ConfigCore
WANTLIB += KF6ConfigGui KF6ConfigWidgets KF6CoreAddons KF6Crash
WANTLIB += KF6GuiAddons KF6I18n KF6KIOCore KF6KIOGui KF6Parts
WANTLIB += KF6Runner KF6Service KF6WidgetsAddons KF6XmlGui Qt6Concurrent
WANTLIB += Qt6Core Qt6Core5Compat Qt6DBus Qt6Gui Qt6Network Qt6OpenGL
WANTLIB += Qt6Positioning Qt6PrintSupport Qt6Qml Qt6QmlMeta Qt6QmlModels
WANTLIB += Qt6QmlWorkerScript Qt6Quick Qt6SerialPort Qt6Sql Qt6Svg
WANTLIB += Qt6SvgWidgets Qt6WebChannel Qt6WebChannelQuick Qt6WebEngineCore
WANTLIB += Qt6WebEngineQuick Qt6WebEngineWidgets Qt6Widgets Qt6Xml
WANTLIB += absl_bad_optional_access absl_bad_variant_access absl_base
WANTLIB += absl_city absl_civil_time absl_debugging_internal absl_decode_rust_punycode
WANTLIB += absl_demangle_internal absl_demangle_rust absl_examine_stack
WANTLIB += absl_graphcycles_internal absl_hash absl_int128 absl_kernel_timeout_internal
WANTLIB += absl_leak_check absl_log_entry absl_log_globals absl_log_internal_check_op
WANTLIB += absl_log_internal_fnmatch absl_log_internal_format
WANTLIB += absl_log_internal_globals absl_log_internal_log_sink_set
WANTLIB += absl_log_internal_message absl_log_internal_nullguard
WANTLIB += absl_log_internal_proto absl_log_internal_structured_proto
WANTLIB += absl_log_severity absl_log_sink absl_low_level_hash
WANTLIB += absl_malloc_internal absl_raw_logging_internal absl_spinlock_wait
WANTLIB += absl_stacktrace absl_str_format_internal absl_strerror
WANTLIB += absl_string_view absl_strings absl_strings_internal
WANTLIB += absl_symbolize absl_synchronization absl_throw_delegate
WANTLIB += absl_time absl_time_zone absl_tracing_internal absl_utf8_for_code_point
WANTLIB += absl_vlog_config_internal c gps m phonon4qt6 protobuf
WANTLIB += protoc shp z

BUILD_DEPENDS =	devel/kf6/kwallet \
		x11/kde-plasma/libplasma

RUN_DEPENDS =	misc/shared-mime-info \
		devel/kf6/kwallet

LIB_DEPENDS =	devel/abseil-cpp \
		devel/kf6/kcolorscheme \
		devel/kf6/kconfig \
		devel/kf6/kconfigwidgets \
		devel/kf6/kcoreaddons \
		devel/kf6/kcrash \
		devel/kf6/ki18n \
		devel/kf6/kio \
		devel/kf6/kparts \
		devel/kf6/krunner \
		devel/kf6/kservice \
		devel/kf6/kwidgetsaddons \
		devel/kf6/kguiaddons \
		devel/kf6/kxmlgui \
		devel/protobuf \
		devel/shapelib \
		multimedia/phonon,qt6 \
		misc/gpsd \
		x11/qt6/qt5compat \
		x11/qt6/qtdeclarative \
		x11/qt6/qtpositioning \
		x11/qt6/qtserialport \
		x11/qt6/qtsvg \
		x11/qt6/qtwebchannel \
		x11/qt6/qtwebengine

CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_libwlocate=ON \
			-DBUILD_MARBLE_TOOLS=ON \
			-DBUILD_MARBLE_EXAMPLES=OFF \
			-DMOBILE=OFF

TEST_IS_INTERACTIVE =	X11

post-extract:
	rm ${WRKSRC}/data/mwdbii/{PISLAND.PNT,PLAKE.PNT}.orig

.include <bsd.port.mk>
