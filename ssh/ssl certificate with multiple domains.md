# How to create a self-signed SSL certificate for multiple domains

Following commands is based on blog [How to create a self-signed SSL certificate for multiple domains](https://medium.com/@pubudu538/how-to-create-a-self-signed-ssl-certificate-for-multiple-domains-25284c91142b)

1. Create a file called openssl.cnf with the following details.
```properties 
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req

[req_distinguished_name]
countryName = cn
countryName_default = cn
stateOrProvinceName = Beijing
stateOrProvinceName_default = Beijing
localityName = chaoyang
localityName_default = chaoyang
organizationalUnitName = dev
organizationalUnitName_default = dev
commonName = *.dev.bizconf.cn
commonName_max = 64

[ v3_req ]
# Extensions to add to a certificate request
basicConstraints = CA:TRUE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.api.dev.bizconf.cn
DNS.2 = *.app.dev.bizconf.cn
DNS.3 = *.qa.bizconf.cn
```
2. Create the Private key.
```bash
sudo openssl genrsa -out server.key 2048
```
3. Create Certificate Signing Request (CSR).
```bash
sudo openssl req -new -nodes -subj "/CN=*.dev.bizconf.cn" -out server.csr -key server.key -config create-cert.cnf 
```
4. Sign the SSL Certificate.
```bash
sudo openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt -extensions v3_req -extfile create-cert.cnf 
```
5. View Certificate
   1. View CSR Entries: This command allows you to view and verify the contents of a CSR (domain.csr) in plain text:
   ```bash
    openssl req -text -noout -verify -in server.csr
   ```
   2. View Certificate Entries
    ```bash
      openssl x509 -text -noout -in server.crt 
    ```
   3. Verify a Certificate was Signed by a CA
   ```bash
      openssl verify -verbose -CAFile ca.crt server.crt 
    ```
6. Verify a Private Key: Use this command to check that a private key (server.key) is a valid key:
    ```bash
    openssl rsa -check -in server.key
    ```
    If your private key is encrypted, you will be prompted for its pass phrase. Upon success, the unencrypted key will be output on the terminal.
7. Verify a Private Key Matches a Certificate and CSR
   Use these commands to verify if a private key (server.key) matches a certificate (server.crt) and CSR (server.csr):
   ```bash
    openssl rsa -noout -modulus -in server.key | openssl md5
    openssl x509 -noout -modulus -in server.crt | openssl md5
    openssl req -noout -modulus -in server.csr | openssl md5
   ```
   If the output of each command is identical there is an extremely high probability that the private key, certificate, and CSR are related.


## The above commands (commands 2/3/4) are similar to below command in effect: [ingress-nginx TLS/HTTPS](https://kubernetes.github.io/ingress-nginx/user-guide/tls/)
```bash
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=${HOST}"
```

## References
   - [OpenSSL Essentials: Working with SSL Certificates, Private Keys and CSRs](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)
   - [申请Let's Encrypt永久免费SSL证书过程教程及常见问题，及续期](https://blog.csdn.net/u013378306/article/details/80030405)
