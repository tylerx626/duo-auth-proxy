A simple and ugly script to help automate some of the deployment process for the Duo Authentication Gateway. This is written specifally for and tested only on CentOS 7.x minimal servers.

Prerequisites:

1. The server will need internet access (repo updates, API access to Duo, etc)
2. git will need to be installed first
```
sudo yum install git
```


1. Clone the repo
```
git clone https://github.com/tylerx626/duo-auth-proxy
```
2. Make the .sh executable
```
chmod +x duo-centos/duoauthproxy_setup.sh
```
3. Run the script
```
duo-auth-proxy/./duoauthproxy_setup.sh
```
4. Follow prompts to create directory, user, and group
5. Edit the config file as needed per your requirements
6. Start the service
```/opt/duoauthproxy/bin/authproxyctl start
```

Future updates wish-list:
1. Error-checking

