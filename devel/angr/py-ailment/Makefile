COMMENT =		angr intermediate language
REVISION =		2

ANGR_PYTHON_MODULE =	ailment

# ailment cannot be used standalone as it requires angr, however
# since angr already requires ailment we'd create a cyclic
# dependency; so skip it here.
RUN_DEPENDS =		devel/angr/py-pyvex>=${MODPY_DISTV}

.include <bsd.port.mk>
