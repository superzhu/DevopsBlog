# IPVS



## ipvsadm
1. ipvsadm related commands
    ```bash
    #  generate a virtual server:
    ipvsadm -A -t 10.131.208.21:80 -s rr

    # Add a real server with masquerading
    ipvsadm -a -t 10.131.208.21:80 -r 192.168.0.5 -w 1 -m

    # Edit the real server without specifying the -m
    ipvsadm -e -t 10.131.208.21:80 -r 192.168.0.5 -w 0 -m

    # Delete virtual service
    ipvsadm -D -t 10.131.208.21:80

    # Show stats
    ipvsadm -L -n --stats --rate
    ```
2. ff

## ipvsadm references
1. [Building a Load Balancer with LVS - Linux Virtual Server](http://www.linux-admins.net/2013/01/building-load-balancer-with-lvs-linux.html)