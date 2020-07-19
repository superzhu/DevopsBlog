# Nginx Configuration

1. Enable your Server Blocks and Restart Nginx
   ```bash
   ln -s /etc/nginx/sites-available/test.com /etc/nginx/sites-enabled/

   ln -s /usr/local/go/bin/go /usr/bin/go
   ```
2. Manually reloading nginx 
```bash
   kubectl exec -it -n ingress-nginx ingress-nginx-controller-... -- nginx -c /etc/nginx/nginx.conf -s reload
```
3. ff


## Nginx References
1. [How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)


## Nginx Ingress Controller
1. [Pain(less) NGINX Ingress](https://danielfm.me/posts/painless-nginx-ingress.html)
2. [Nginx Ingress Reload的坑](http://terrence.logdown.com/posts/7803375-nginx-ingress-renewal-pit)