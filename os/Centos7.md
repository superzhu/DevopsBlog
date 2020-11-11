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
3. ff


## References
1. [No IP address on VMware running centos 7](https://unix.stackexchange.com/questions/206217/no-ip-address-on-vmware-running-centos-7)
2. [How To Configure Static IP Address in CentOS 7 / RHEL 7](https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-configure-static-ip-address-in-centos-7-rhel-7-fedora-26.html)