DEPENDS_append_rpi = " rpi-u-boot-scr"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"

SCMVERSION = "n"
SRC_URI = "git://github.com/Scott31393/u-boot-tm-2018.09.git;user=betauser:betauser;protocol=https"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

