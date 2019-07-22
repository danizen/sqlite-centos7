# sqlite-centos7
Rebuild a version of sqlite from later version of Fedora for CentOS 7

## Summary

Uses by default http://mirrors.rit.edu/fedora/archive/fedora/linux/releases/23/Everything/source/SRPMS/s/sqlite-3.8.11.1-1.fc23.src.rpm 
as the upstream rpm, but an argument can be passed.

Includes its own spec file because the one included in Fedora 23 did not quite work, differences are in `sqlite.spec.patch`.

Defines macros to make the rpmbuild root under the checkout directory.

## Usage

To run the build, do the following:

```bash
./rpmdev.sh [ --upstream URL ] [ --spec SPEC ] [ --rpmbuild PATH ] [arguments for rpmbuild]
```
