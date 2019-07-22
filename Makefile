SRPM_URL="http://mirrors.rit.edu/fedora/archive/fedora/linux/releases/23/Everything/source/SRPMS/s/sqlite-3.8.11.1-1.fc23.src.rpm"
SRPM_FILE=$(shell basename $(SRPM_URL))

SPEC="sqlite.spec"

RPMBUILD_PATH=$(shell rpm --eval '%{_topdir}')

UPDIR=upstream
UPSTREAM=\
 $(UPDIR)/$(SRPM_FILE)

.PHONY: setuptree deps verify purge


deps: $(UPSTREAM) 


$(UPDIR)/$(SRPM_FILE):
	- mkdir $(UPDIR)
	wget -O $(UPDIR)/$(SRPM_FILE) $(SRPM_URL)


verify: deps checksums
	sha1sum -c checksums

setuptree: deps
	-mkdir -p $(RPMBUILD_PATH)/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	rpm -Uvh $(UPDIR)/$(SRPM_FILE)

purge:
	-rm -rf $(UPDIR)





