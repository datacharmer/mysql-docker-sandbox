# MySQL Sandbox and Docker 

This repository contains the code to create Docker images for MySQL Sandbox in Docker.

* **distro-resize** is the low level code needed to resize the contents of MySQL tarballs (down to 5% of the original size.)
* **mysql-docker-sb-base** is the base image, which you can use stand-alone, with tarballs in the host computer.
* **mysql-docker-sb-full** is the full image, containing the mini tarballs created by distro-resize.
