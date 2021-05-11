# auxillary-project

## This shell script creates new users on a linux server

+ The script would read names from a  CSV file, create users on the server, and add each user to an existing group called **developers** .
    
+ The script will first check for the existence of the user on the system, before it attempts to create that it.
    
+ The user being created will have a default home folder

+ The user will have a .ssh folder within its HOME folder.

+ For each user’s SSH configuration, create an authorized_keys which would have the public key of our current user.

### Setting up the server

1. Make sure port 22 is added to your inbound rules on your instance. 

1. Create ``developers`` group
```
groupadd developers
```
2. Log into your server and create a directory called shell
``mkdir Shell && cd Shell``

1. copy the files from your machine to the ``Shell`` direcotry using 
```
scp names.csv onboarding_users.sh remote-user@<ip_address_of_remote-user>:/home/user/Shell
```
4. Change directory to `ssh` and run 
```
ssh-keygen -t rsa
```
5. In the ``shell`` folder, run 
```
./onboarding_users
```
A video implementation of the script is [here](https://youtu.be/S_XGRfKA-UQ)