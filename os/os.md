# OS related commands
1. Easy command line method to determine specific ARM architecture string?
    ```bash
    dpkg --print-architecture

    systemctl -l status kubelet --no-pager
    ```
2. ff


## Linux Important Kernel Parameters

1. vm.max_map_count
   <p>This file contains the maximum number of memory map areas 
   a process may have. Memory map areas are used as a side-effect 
   of calling malloc, directly by mmap and mprotect, and also 
   when loading shared libraries.</p>


   <p>While most applications need less than a thousand maps, 
   certain programs, particularly malloc debuggers, may consume 
   lots of them, e.g., up to one or two maps per allocation.</p>

   The default value is 65536.
   ```shell
   sysctl -w vm.max_map_count=1394966
    # is just a nicer way of writing this:
    echo 1394966 > /proc/sys/vm/max_map_count

    echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
    sysctl -p

    cat /proc/sys/vm/max_map_count
   ```

2. Linux's huge (2 MB) memory pages
   ```shell
   echo 67584 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
   
   echo 340568 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
   #Then verify that they have been created (1 GB is 512 pages, 
   # so 67,584 pages is 132 GB)
   cat /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
   ```
   

# References
1. [Notes on Java's new Z Garbage Collector](https://blog.jayan.kandathil.ca/zgc.html)
2. [What are the huge pages in Linux?](https://kerneltalks.com/services/what-is-huge-pages-in-linux/)
3. [3 easy steps to configure hugepages in RHEL/CentOS 7/8](https://www.golinuxcloud.com/configure-hugepages-vm-nr-hugepages-red-hat-7/)