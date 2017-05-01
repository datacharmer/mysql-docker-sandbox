# Docker containers for MySQL-Sandbox

See [mysql-docker-minimal](https://github.com/datacharmer/mysql-docker-minimal) for an alternative solution

# MySQL Sandbox and Docker 

This repository contains the code to create Docker images for MySQL Sandbox in Docker.

* **distro-resize** is the low level code needed to resize the contents of MySQL tarballs (down to 5% of the original size.)
* **mysql-sb-base** is the base image, which you can use stand-alone, with tarballs in the host computer. (201 MB) 
* **mysql-sb-gz** is the image containing the **compressed** mini tarballs created by distro-resize. (201 MB)
* **mysql-sb-full** is the full image, containing the mini tarballs ready to use. (714 MB)
* **mysql-sb-thin** is a thin image, containing the mini tarballs ready to export as a volume. (514 MB)

