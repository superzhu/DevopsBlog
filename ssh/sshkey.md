# 记录ssh链接配置问题

## ubuntu 18.04用户和组
1. List all groups
```bash
   cat /etc/group
```
2. List all users
```bash
   awk -F':' '$2 ~ "\$" {print $1}' /etc/shadow
```
3. In order to view members of a group, use the following command:
```bash
  groups username
```
4. Use the following command to list the group members along with their GIDs:
```bash
  id username
```
5. Adding a Group
```bash
  sudo addgroup/delgroup [groupname]
```
6. Adding already existing Users to a Group
```bash
  sudo adduser [username] [groupname]
```
7. Adding A User Through the Command Line
```bash
  sudo adduser [username]
```
8. add the new user to an existing sudo group:
```bash
   usermod -aG sudo surpass
```
9. Install sshd service
```bash
  apt-get install openssh-server
```
10. **How to change Swappiness**? The swappiness parameter value is stored in a simple configuration text file located in **/proc/sys/vm and is named “swappiness”**. If you navigate there through the file manager, you will be able to locate the file and open it to check your system's swappiness. You can also check it or change it through the terminal (which is faster) by typing the following command:
  ```bash
  sudo sysctl vm.swappiness=10
  cat /proc/sys/vm/swappiness
  ```
11. ff

## 关于Ubuntu拒绝root用户ssh远程登录
#sudo vim /etc/ssh/sshd_config

找到并用#注释掉这行：PermitRootLogin prohibit-password

新建一行 添加：PermitRootLogin yes

重启服务 : sudo service ssh restart

## PKI tool(cfssl)

## ssh-copy-id
```bash
  ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/rocket_dev_rsa

  ssh-keygen -t rsa -b 2048 -C "superzhu" -f ~/.ssh/liyanming_devrsa

  ssh-copy-id -i ~/.ssh/mykey user@host
  
  Use RSA private key to generate public key for SSH purposes
  ssh-keygen -y -f key.pem > key.pub
```

## 配置Windows 10 As Ansible Management Client
```bash
./ConfigureRemotingForAnsible.ps1 -Verbose -CertValidityDays 3650

WinRM HTTPS
```

## Using an SSH Gateway in MobaXTerm
1. [Using an SSH Gateway in MobaXTerm](https://lts.lehigh.edu/services/stepwise-instructions/using-ssh-gateway-mobaxterm)
2. [SSH tunnels and port forwarding](https://blog.mobatek.net/post/ssh-tunnels-and-port-forwarding/)

## Curl and wget
```bash
curl -HHost:webservice.greetings.com
--resolve webservice.greetings.com:31390:127.0.0.1 -k https://webservice.greetings.com:31390/


```


## References
1. [USE SSH-KEYS FOR AUTHENTICATION WITH MOBAXTERM](https://cinhtau.net/2016/02/03/use-ssh-keys-for-authentication-with-mobaxterm/)
2. [Using Ansible as a Windows Admin with Visual Studio Code, a complete guide!](https://workspace-guru.com/2018/07/29/using-ansible-as-a-windows-admin-with-visual-studio-code-a-complete-guide/)
3. [Disabling SSH Timeout When Connecting to/from Ubuntu](http://queirozf.com/entries/disabling-ssh-timeout-when-connecting-to-from-ubuntu)
4. [ubuntu设置 SSH 通过密钥登录](https://www.cnblogs.com/tecliu/p/8252032.html)
5. [How to Change the Swappiness Value in Linux](https://linuxize.com/post/how-to-change-the-swappiness-value-in-linux/)
