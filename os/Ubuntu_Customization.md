# Customize Ubuntu 18.04.4 With Cubic

## Steps for the customization
1. Install Cubic on Ubuntu 18.04.4 desktop
    ```bash
    apt-add-repository ppa:cubic-wizard/release
    apt update
    apt install cubic
    ```
2. Download Install ISO 
   ```bash
   http://cdimage.ubuntu.com/releases/18.04.4/release/ubuntu-18.04.4-server-amd64.iso
   ```
3. Create empty custom and Run Cubic
    ```bash
    mkdir -p /home/surpass/custom
    ```
4. Modify /etc/apt/sources.list file
   ```bash
   deb http://archive.ubuntu.com/ubuntu bionic main restricted
   ```
5. ff