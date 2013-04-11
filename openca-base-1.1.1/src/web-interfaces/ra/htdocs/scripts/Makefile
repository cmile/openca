# file: src/web-interfaces/ra/htdocs/scripts/Makefile
#
# © 2002 OpenCA Group

TOP	= ../../../../..
include $(TOP)/Makefile.global-vars

DEST_HTDOCS_SCRIPTDIR	= ${ra_htdocs_fs_prefix}/scripts
SCRIPTSRC		= $(TOP)/src/common/lib/javascript

DEST_FILES	= \
	ieCSR.js	\
	ieVistaCSR.js	\
	ieVistaEnroll.js	\
	ieEnroll.js	\
	nssCSR.js	\
	signForm.js	\
	openca-menu.js  \
	signForm.vbs

#---- variable settings above, rules below ----

.PHONY:	default install clean distclean

default::

$(DEST_HTDOCS_SCRIPTDIR):
		$(MAKE) __install_dir USER=${openca_user} GROUP=${openca_group} MODE=755 DIR=$@

install::	$(LOCALES)

$(DEST_FILES)::	$(DEST_HTDOCS_SCRIPTDIR)
$(DEST_FILES)::
		$(INSTALL) -o ${openca_user} -g ${openca_group} -m 644 $(SCRIPTSRC)/$(LANG)/$@ $(DEST_HTDOCS_SCRIPTDIR)/$(LANG)/$@

$(LOCALES)::	$(DEST_HTDOCS_SCRIPTDIR)
		$(MAKE) __install_dir USER=${openca_user} GROUP=${openca_group} MODE=711 DIR=$(DEST_HTDOCS_SCRIPTDIR)/$@
		$(MAKE) $(DEST_FILES) LANG=$@

clean::
distclean::
		#$(RM)
