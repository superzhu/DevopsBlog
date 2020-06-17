# Ansible terminology

1. Idiomatic way to check whether a host is reachable?
    ```bash
    - name: Check if host is accessible
      wait_for: host=<host to check> port=80 timeout=3
      register: host_accessible
      failed_when: False
      
       include: do_something_that_requires_access.yml
       when: host_accessible.state is defined and host_accessible.state == "started"
    ```
2. ff


## References
1. [Connectivity check WITH Ansible](https://dev.to/koh_sh/connectivity-check-with-ansible-1po)
2. [net_ping – Tests reachability using ping from a network device](https://docs.ansible.com/ansible/latest/modules/net_ping_module.html)