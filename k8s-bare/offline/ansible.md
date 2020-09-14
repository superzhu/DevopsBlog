# Ansible Offline Installation (Ubuntu)

1. Install openssh-server,vim:
   1. To download a package with all dependencies, without installing them, just run:  sudo apt-get install --download-only <package_name>
   ```bash
       sudo apt-get install --download-only vim
       sudo apt-get install --download-only openssh-server
   ```
   2. All downloaded files will be saved in **/var/cache/apt/archives** directory.
   3. To install the downloaded packages, go to the cache folder and install them as shown below.
   ```bash
     sudo dpkg -i *
   ```
   4. Install **python3-pip**:
   ```bash
   sudo apt-get install --download-only vim-runtime




   sudo apt-get install --download-only python-pip-whl
   sudo apt-get install --download-only python3-distutils
   sudo apt-get install --download-only build-essentia
   sudo apt-get install --download-only python3-dev  python3-setuptools  python3-wheel

   sudo apt-get install --download-only python3-pip
   ```
   5. Install ansible
   ```bash
   sudo apt-get install --download-only software-properties-common
   sudo apt-add-repository --yes --update ppa:ansible/ansible
   sudo apt-get install --download-only ansible

   pip3 download ansible
   pip3 install ./ansible-2.9.13.tar.gz --user

   pip3 download netaddr
   sudo pip3 install ./netaddr-0.8.0-py2.py3-none-any.whl --user

    pip3 download ipaddr
    sudo pip3 install ./ipaddr-2.2.0.tar.gz --user

    pip3 download pymongo
    sudo pip3 install ./pymongo-3.11.0-cp36-cp36m-manylinux1_x86_64.whl --user
   ```
   6. ff
2. [Download ppa installation tar](https://launchpad.net/~ansible/+archive/ubuntu/ansible/+packages?field.name_filter=&field.status_filter=&field.series_filter=)  ansible_2.9.13-1ppa_bionic.tar.gz
3. **Soft link for Python**: ln -s /usr/bin/python3.6 /usr/bin/python
4. ff


## References
1. [Download Packages With Dependencies Locally In Ubuntu](https://ostechnix.com/download-packages-dependencies-locally-ubuntu/)