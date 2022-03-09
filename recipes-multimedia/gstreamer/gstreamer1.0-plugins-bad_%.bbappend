BRANCH ?= "xlnx-rebase-v1.18.5"
REPO ?= "git://github.com/Xilinx/gst-plugins-bad.git;protocol=https"

BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH') != '']}"

PV = "1.18.5+git${SRCPV}"

SRC_URI = " \
    ${REPO};${BRANCHARG};name=base \
    file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
    file://0002-avoid-including-sys-poll.h-directly.patch \
    file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
    file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
    file://0005-msdk-fix-includedir-path.patch \
"

SRCREV_base = "f8ddf8e3101b03d0d1e929e3a329f2e358c2aab8"
SRCREV_FORMAT = "base"

PACKAGECONFIG[mediasrcbin] = "-Dmediasrcbin=enabled,-Dmediasrcbin=disabled,media-ctl"
PACKAGECONFIG:append = " faac kms faad opusparse mediasrcbin"

S = "${WORKDIR}/git"
