
# PORKY

An automated SSL cert checker & downloader for porkbun websites @hansoh0 (https://www.github.com/hansoh0)

## Installation

Install requirements with pip

```
pip install -r requirements.txt
```
## How to Use
The script is best set up as a cron job on the specified server
```
# Run the script every day at 1 AM                                                                                                                                                                         
0 1 * * * python3 /usr/src/app/porky.py >> /var/log/cron.log 2>&1
```
Im too lazy to change this variable to be evironmentally set so change "DOMAIN_HERE" in line 121 to your domain. eg. example.com:
```
check_ssl_certificate_expiry("example.com") 
```
All grabbed certs and keys can be found under $HOME/ssl/certs. eg. /home/hansoho/ssl/certs
```
[hansoho@theFalcon]:~/ssl/certs >> ls -la                                                                                                                                                            
total 20                                                                                                                                                                                                   
drwxrwxr-x 2 hansoho hansoho 4096 May 31 03:13 .                                                                                                                                                     
drwxrwxr-x 3 hansoho hansoho 4096 May 31 03:13 ..                                                                                                                                                    
-rw-rw-r-- 1 hansoho hansoho 1066 May 31 03:13 certificate_chain.pem                                                                                                                                 
-rw-rw-r-- 1 hansoho hansoho 3364 May 31 03:13 private_key.pem                                                                                                                                       
-rw-rw-r-- 1 hansoho hansoho 3222 May 31 03:13 public_key.pem
-rw-rw-r-- 1 hansoho hansoho 3567 May 31 03:13 intermediate_certificate.pem
```
make sure to create a .env file
```
SEC_KEY = "sk1_98ea6e4f216f2fb4b69fff9b3a44842c38686ca685f3f55dc48c5d3fb1107be4"  # These are placeholder keys, not my real keys                                                                                                                         
API_KEY = "pk1_98ea6e4f216f2fb4b69fff9b3a44842c38686ca685f3f55dc48c5d3fb1107be4"  # Get bent, skiddies                                                                           
ENDPOINT = "https://porkbun.com/api/json/v3/ssl/retrieve/yourdomain.com"      
```
Have fun ya animals
