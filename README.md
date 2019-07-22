# sqlite-centos7
Rebuild a version of sqlite from later version of Fedora for CentOS 7

## Summary

Uses by default http://mirrors.rit.edu/fedora/archive/fedora/linux/releases/23/Everything/source/SRPMS/s/sqlite-3.8.11.1-1.fc23.src.rpm 
as the upstream rpm, but an argument can be passed.

Includes its own spec file because the one included in Fedora 23 did not quite work, differences are in `sqlite.spec.patch`.


## Usage

To download the SRPM and verify its checksum, do:

```bash
make verify
```

To extract it into the rpmbuild directory, by default `~/rpmbuild` but can also be redefined using `~/.rpmmacros`, do:

```bash
make setuptree
```

To build the rpm once it is extracted, run:

```bash
rpmbuild -ba sqlite.spec
```

## AWS Notes

Building this on an instance of type `t2.small` failed because sqlite wants to test files larger than 2 GB.
Tests worked OK on `t2.large`.

Because of the AMI we use at work, `/home/ec2-user` is not executable, so I do the following:

```bash
sudo install -d /opt/code -o ec2-user -g ec2-user
cat <<EOF >~/.rpmmacros
%_topdir /opt/code/rpmbuild
```
