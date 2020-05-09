## OVF, ISO, BIN format

### 扩展OVF磁盘大小的步骤
1. 关闭虚拟机电源(Power off the virtual machine.)
2. 编辑虚拟机设置并扩展虚拟磁盘大小(Edit the virtual machine settings and extend the virtual disk size)
3. 打开虚拟机电源(Power on the virtual machine)
4. 标识设备名称（默认为/dev/sda），并通过运行以下命令确认新大小：(Identify the device name, which is by default /dev/sda, and confirm the new size by running the command:)
```bash
    fdisk -l 
```
5. 删除并重新创建主分区: (Delete and re-create primary partition:)
```bash
    fdisk /dev/sda

    Press p to print the partition table to identify the number of partitions. By default, there are 2: sda1 and sda2.

    Press d to delete the last partition.
    Press Enter to confirm.

    Press n to create a new primary partition.
    Press 2 for the partition number, depending on the output of the partition table print.
    Press Enter two times

    Do you want to remove the signature? Y

    Press w to write the changes to the partition table.

    parted -l (to remove error: GPT PMBR size mismatch)

    resize2fs /dev/sda2（改为目标磁盘位置)
```
6. List partitions on your system
```bash
    sudo fdisk -l
```
7. Install qemu-img on Ubuntu 18.04
```bash
    sudo apt-get install qemu-utils
```
8. tool: systemback/UltraISO/PowerISO/Cubic for Custom Ubuntu ISO Creator


## References
1. [VMware虚拟机添加磁盘](https://blog.csdn.net/u012331758/article/details/78285944)
2. [Need to expand OVF disk size](https://forum.xorux.com/discussion/60/need-to-expand-ovf-disk)
3. [解决fdisk与df命令显示的磁盘空间不一样](https://www.qiujiahui.com/2017/08/07/%E8%A7%A3%E5%86%B3fdisk%E4%B8%8Edf%E5%91%BD%E4%BB%A4%E6%98%BE%E7%A4%BA%E7%9A%84%E7%A3%81%E7%9B%98%E7%A9%BA%E9%97%B4%E4%B8%8D%E4%B8%80%E6%A0%B7/)
4. [Create and manage hard drive partitions from the Linux command line--fdisk](https://www.lifewire.com/linux-command-fdisk-4091540)
5. [How to Use Fdisk to Manage Partitions on Linux](https://www.howtogeek.com/106873/how-to-use-fdisk-to-manage-partitions-on-linux/)
6. [Linux parted command](https://www.computerhope.com/unix/parted.htm)

## Disk Converter
1. [Install qemu-img on Ubuntu 16.04](https://www.linuxdesk.com/2017/03/install-qemu-img-on-ubuntu-1604.html)
2. [Converting a virtual disk image: VDI or VMDK to an ISO you can distribute](https://www.turnkeylinux.org/blog/convert-vm-iso)
3. [How to Convert a VMDK to an ISO File](https://www.sevenbits.io/blog/iso/puredarwin/osx/2015/03/11/convert-to-iso.html)
4. [HOW TO CONVERT VMDK TO ISO IN WINDOWS](https://www.ilovefreesoftware.com/26/featured/how-to-convert-vmdk-to-iso-in-windows.html)
5. [Make a bootable ISO from your Linux Virtual Machine!](https://www.youtube.com/watch?v=2tUkmeDdXjM)

## Create Custom Live CD image using Cubic on Ubuntu
1. [How to Create Custom Live CD image using Cubic on Ubuntu](https://linoxide.com/linux-how-to/create-custom-live-cd-image-cubic-ubuntu/)
2. [How to create a custom Ubuntu ISO with Cubic](https://www.techrepublic.com/article/how-to-create-a-custom-ubuntu-iso-with-cubic/)
3. [如何创建定制的 Ubuntu Live CD 镜像](https://www.linuxidc.com/Linux/2018-01/150491.htm)
4. [https://linuxhint.com/customize_ubuntu_iso_create_spin/](https://linuxhint.com/customize_ubuntu_iso_create_spin/)
5. [Create Your Own Linux Distro with Ubuntu Imager](https://www.maketecheasier.com/create-linux-distro/)
6. [MakeALiveCD/DVD/BootableFlashFromHarddiskInstall](https://help.ubuntu.com/community/MakeALiveCD/DVD/BootableFlashFromHarddiskInstall)