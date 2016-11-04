FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = " \
    file://uEnv.txt_internal \
    "

do_deploy_append () {
    install ${WORKDIR}/uEnv.txt_internal ${DEPLOYDIR}
}
