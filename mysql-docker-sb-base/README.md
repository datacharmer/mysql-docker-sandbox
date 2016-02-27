# Base image to run a MySQL Sandbox

This docker image contains the minimum environment needed to run MySQL Sandbox.
It installs a Debian base image, and on top of that it will add Perl, the core libraries, and MySQL Sandbox itself.
It will also create a regular user (msandbox) that will run the sandboxes.

## USAGE

You can use this image as a base for the fuller image that contains reduced MySQL tarballs, or you can run it directly with the tarballs already in your host computer.

For example, you have expanded tarballs in $HOME/opt/mysql

    $ ls $HOME/opt/mysql
    5.6.28  5.7.11  

    $ docker run -ti --name sbox -v $HOME/opt/mysql:/opt/mysql datacharmer/mysql-sb-base bash
    msandbox@3d4a8d9ca186:~$ make_sandbox 5.6.28 -- --no_show
    The MySQL Sandbox,  version 3.1.05
    (C) 2006-2016 Giuseppe Maxia
    loading grants
    . sandbox server started
    Your sandbox server was installed in $HOME/sandboxes/msb_5_6_28
    msandbox@3d4a8d9ca186:~$ ~/sandboxes/msb_5_6_28/use
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 3
    Server version: 5.6.28 MySQL Community Server (GPL)

    Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql [localhost] {msandbox} ((none)) >


Or, you may have a tarball in a directory:

    $ ls $HOME/downloads
    mysql-5.1.72-linux-x86_64-glibc23.tar.gz

    $ docker run -ti --name sbox -v $HOME/downloads:/opt/mysql datacharmer/mysql-sb-base bash
    
    msandbox@2b0a53ad8e71:~$ make_sandbox ~/opt/mysql/mysql-5.1.72-linux-x86_64-glibc23.tar.gz -- --no_show
    unpacking /home/msandbox/opt/mysql/mysql-5.1.72-linux-x86_64-glibc23.tar.gz
        The MySQL Sandbox,  version 3.1.05
        (C) 2006-2016 Giuseppe Maxia
    loading grants
    . sandbox server started
    Your sandbox server was installed in $HOME/sandboxes/msb_5_1_72

    msandbox@2b0a53ad8e71:~$ ~/sandboxes/msb_5_1_72/use
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 3
    Server version: 5.1.72 MySQL Community Server (GPL)

    Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql [localhost] {msandbox} ((none)) >

