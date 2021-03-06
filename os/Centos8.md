# Centos Installation

1. [How To Download A RPM Package With All Dependencies In CentOS](https://ostechnix.com/download-rpm-package-dependencies-centos/)
    ```bash
    yum install --downloadonly --downloaddir=<directory> <package-name>

    yum install yum-utils
    #To download packages along with all dependencies to a specific location, use --destdir option:
     yumdownloader --resolve --destdir=/root/mypackages/ httpd
    ```
2. How To Install An RPM File On Linux OS
    ```bash
    rpm -ivh *.rpm
    ```
3. Install Python3
   ```bash
   dnf install --downloadonly --destdir /root/downloads bzip2-devel expat-devel gdbm-devel ncurses-devel openssl-devel readline-devel wget sqlite-devel tk-devel xz-devel zlib-devel libffi-devel vim make

   yum remove zlib-devel

   rpm -ivh *.rpm

   yum list installed | grep zlib-devel

   wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz

   tar -xf Python-3.9.0.tgz

   ./configure --enable-optimizations

   # Start the Python 3.8 build process by running:
   make -j 4

   # Once the build process is complete, install the Python binaries:
   sudo make altinstall
   OR make install
   ```
4. Install Ansible on Centos 8
    ```bash
    # update the DNF package repository cache with the following command:
    dnf makecache

    # to enable EPEL repository, install the epel-release package with the following command:
    dnf install --downloadonly --destdir /root/downloads epel-release

    rpm -ivh *.rpm
    dnf makecache

    dnf install --downloadonly --destdir /root/downloads  ansible

    pip3 download pymongo --dest=/home/surpass/modules/pip3
    ```
5. You disable secure boot temporally on startup with MOK manager
    ```bash
    sudo mokutil  --disable-validation
    root password
    mok password: 12345678
    mok password: 12345678
    sudo reboot
    ```
6.  List all modules that are built into the currently running kernel
    ```bash
    cat /lib/modules/$(uname -r)/modules.builtin

    cat /lib/modules/$(uname -r)/modules.builtin | grep br_netfilter
    ```
7.  yum local update
    ```bash
    yum localupdate -y package1.rpm

    yum-config-manager --add-repo=/home/surpass/devops/centos7/softs/docker/docker-ce.repo
    ```
8.  ff


## References
1. [No IP address on VMware running centos 7](https://unix.stackexchange.com/questions/206217/no-ip-address-on-vmware-running-centos-7)
2. [How To Configure Static IP Address in CentOS 7 / RHEL 7](https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-configure-static-ip-address-in-centos-7-rhel-7-fedora-26.html)
3. [How to Install Python 3.8 on CentOS 8](https://linuxize.com/post/how-to-install-python-3-8-on-centos-8/)
4. [Installing Ansible to CentOS 8](https://medium.com/@akingsukh/installing-ansible-to-centos-8-bee36ab9d279)
5. [elrepo centos repo download](https://elrepo.org/linux/kernel)