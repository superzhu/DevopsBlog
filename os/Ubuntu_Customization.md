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
    ![Cubic startup](images/cubic_startup.PNG?raw=true)
4. Select base ISO
    ![Cubic base ISO](images/cubic_baseiso.png?raw=true)
5. Modify /etc/apt/sources.list file
   ```bash
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic main restricted
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic-updates main restricted
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic universe
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic-updates universe
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic multiverse
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic-updates multiverse
   deb http://cn.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
   deb http://security.ubuntu.com/ubuntu bionic-security main restricted
   deb http://security.ubuntu.com/ubuntu bionic-security universe
   deb http://security.ubuntu.com/ubuntu bionic-security multiverse
   ```
6. Run command:
    ```bash
    apt-get update

    or
    # apt-get clean
    apt-get update --fix-missing  
    ```
7. Upgrade Ubuntu Kernel:<cannot run apt-get upgrade>
    ```bash
    apt-get install -y --reinstall  linux-image-unsigned-5.0.0-37-generic
    ```
    Save Grub configuration:
     ![Grub configuration](images/grub-pc.png?raw=true)
8.  Run command:
    ```bash
    apt-get install -y vim openssh-server
    ```
9.  [Install Ansible in Ubuntu 18.04 LTS with pip3](https://sharadchhetri.com/2018/10/07/install-ansible-in-ubuntu-18-04-lts-with-pip3/)
    ```bash
    #apt-get -y install software-properties-common
    apt install python3-pip
	apt-get update
	pip3 install ansible --user
    pip3 install netaddr --user
    pip3 install ipaddr --user

    vim ~/.profile
    export PATH=$PATH:$HOME/.local/bin
    ```
10. Select Ubuntu kernel from Original ISO, not upgraded Kernel
     ![Original Ubuntu Kernel](images/cubic_originKernel.png?raw=true)
11. Add following content to /preseed/ubuntu-server.seed
    ```bash
    ### Localization
    d-i debian-installer/locale string en_US.UTF-8
    d-i localechooser/supported-locales multiselect en_US.UTF-8
    # Keyboard
    d-i console-setup/ask_detect boolean false
    d-i keyboard-configuration/xkb-keymap select us
    
    ### Account setup
    d-i passwd/root-login boolean true
    
    # Root password, either in clear text
    d-i passwd/root-password password zhuzhi
    d-i passwd/root-password-again password zhuzhi
    
    # To create a normal user account.
    d-i passwd/user-fullname string surpass
    d-i passwd/username string surpass
    # Normal user's password, either in clear text
    d-i passwd/user-password password zhuzhi
    d-i passwd/user-password-again password zhuzhi
    # Create the first user with the specified UID instead of the default.
    #d-i passwd/user-uid string 1010
    # The installer will warn about weak passwords. If you are sure you know
    # what you're doing and want to override it, uncomment this.
    d-i user-setup/allow-password-weak boolean true
    
    # Controls whether or not the hardware clock is set to UTC.
    d-i clock-setup/utc boolean true
    
    # You may set this to any valid setting for $TZ; see the contents of
    # /usr/share/zoneinfo/ for valid values.
    d-i time/zone string Asia/Shanghai
    
    # Controls whether to use NTP to set the clock during the install
    d-i clock-setup/ntp boolean false
    
    # NTP server to use. The default is almost always fine here.
    #d-i clock-setup/ntp-server string cn.pool.ntp.org
    ```
12. Passwordless login customization
    ```bash
    1. chmod  0700 /root/.ssh
    2. mode for files under /root/.ssh 0600 
    ```
13. Install Docker from Official Repository
    ```bash
    # 1.  Update Local Database
    apt-get update

    # 2. Download Dependencies
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent

    # 3. Add Docker’s GPG Key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # 4.  Install the Docker Repository
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

    # 5. Update Repositories
    apt-get update

    # 6. Install Specific Version of Docker 
    apt-cache madison docker-ce

    apt-get install -y docker-ce=5:19.03.8~3-0~ubuntu-bionic
    apt-get install -y docker-ce-cli=5:19.03.8~3-0~ubuntu-bionic
    apt-get install -y containerd.io
    ```
14. ff



# References
1. [Note: Auto-Install Ubuntu with Custom Preseed ISO](https://www.pugetsystems.com/labs/hpc/Note-Auto-Install-Ubuntu-with-Custom-Preseed-ISO-1654/)
2. [Install Ansible in Ubuntu 18.04 LTS with pip3](https://sharadchhetri.com/2018/10/07/install-ansible-in-ubuntu-18-04-lts-with-pip3/)
3. [B.4. Contents of the preconfiguration file (for focal)](https://help.ubuntu.com/lts/installation-guide/amd64/apbs04.html)