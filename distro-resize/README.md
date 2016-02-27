# How to reduce the contents of a MySQL tarball 

1. download the tarball in this directory
2. expand the tarball
3. rename the tarball to the version number (e.g. mysql-5.7.11-linux-glibc2.5-x86_64 -> 5.7.11)
4. run ./make_reduced_distro.sh x.x.xx
5. If needed, add the files list for the required version (e.g. ./make_reduced_distro.sh 5.6.28 files56.txt)

After the operation the initial directory will be renamed to full_x.x.xx, while the directory x.x.xx will contain the reduced storage.
