# Using MySQL Sandbox with reduced tarballs

This image contains the same software present in datacharmer/mysql-sb-base, and a collection of reduced tarballs for MySQL versions

* 5.0.96
* 5.1.72
* 5.5.48
* 5.6.28
* 5.7.11

The reduced tarballs are a cherrypick of tarballs distributed by MySQL, with only the files strictly needed to run a server, and the debug information stripped out. (See distro-resize in this same repository for more info.)

There are two flavors of this image. They both contain the same software, but the way it is packaged changes dramatically.

The image datacharmer/mysql-sb-gz is less than 300 MB. The tarballs are compressed and require the execution of a simple command before starting.

    $ docker run -ti --name sbox datacharmer/mysql-sb-gz bash

    msandbox@b0672d141e3d:~$ ls
    opt  setup.sh  README
    msandbox@b0672d141e3d:~$ ./setup.sh
    # expanding 5.0.96.tar.gz
    # expanding 5.1.72.tar.gz
    # expanding 5.5.48.tar.gz
    # expanding 5.6.28.tar.gz
    # expanding 5.7.11.tar.gz

    msandbox@b0672d141e3d:~$ ls ~/opt/mysql/
    5.0.96  5.1.72  5.5.48  5.6.28  5.7.11

    msandbox@b0672d141e3d:~$ make_sandbox 5.7.11 -- --no_show
        The MySQL Sandbox,  version 3.1.05
        (C) 2006-2016 Giuseppe Maxia
    loading grants
    . sandbox server started
    Your sandbox server was installed in $HOME/sandboxes/msb_5_7_11
    msandbox@b0672d141e3d:~$
    msandbox@b0672d141e3d:~$ ~/sandboxes/msb_5_7_11/use
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 4
    Server version: 5.7.11 MySQL Community Server (GPL)

    Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql [localhost] {msandbox} ((none)) >


The second image works exactly like the first one, but it does not require ./setup.sh. It will be ready to use. The drawback is that it is 481 MB instead of 272.

    $ docker run -ti --name sbox datacharmer/mysql-sb-full bash

    msandbox@dc423a9823ef:~$ ls 
    opt README

    msandbox@dc423a9823ef:~$ ls ~/opt/mysql/
    5.0.96  5.1.72  5.5.48  5.6.28  5.7.11

    msandbox@dc423a9823ef:~$ make_sandbox 5.7.11 -- --no_show
        The MySQL Sandbox,  version 3.1.05
        (C) 2006-2016 Giuseppe Maxia
    loading grants
    . sandbox server started
    Your sandbox server was installed in $HOME/sandboxes/msb_5_7_11
    msandbox@dc423a9823ef:~$
    msandbox@dc423a9823ef:~$ ~/sandboxes/msb_5_7_11/use
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 4
    Server version: 5.7.11 MySQL Community Server (GPL)

    Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql [localhost] {msandbox} ((none)) >


