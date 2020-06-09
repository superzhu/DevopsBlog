# Cron and crontab
1. Where is the cron / crontab log on Ubuntu?
   ```bash
   # You can see just cron jobs in that logfile by running
   grep CRON /var/log/syslog

   tail -f /var/log/syslog | grep CRON

   journalctl -fu cron.service
   ```
2. You can create a cron.log file to contain just the CRON entries that show up in syslog
   ```bash
   # Open the file
   vim /etc/rsyslog.d/50-default.conf

   # Find the line that starts with:
   #cron.*

   # uncomment that line, save the file, and restart rsyslog:
   sudo service rsyslog restart

   # You should now see a cron log file here:
   /var/log/cron.log
   ```
3. ff


## References
1. [Ansible cron – Manage cron.d and crontab entries](https://docs.ansible.com/ansible/latest/modules/cron_module.html)