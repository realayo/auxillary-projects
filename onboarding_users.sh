#! /bin/bash

if getent passwd $1 > /dev/null 2>&1; then
    echo "the user exists" 
else
    echo "No, the user does not exist"
fi

for i in $( cat names.csv ); do
    echo creating user: "$i"
    sudo adduser --disabled-password -GECOS "" $i
    echo "user $i added successfully!"
    echo "$i:password" | sudo chpasswd
    echo "Password for user $i changed successfully"

    echo add user to developers group
    sudo adduser $i developers
    #sudo useradd -G developers $i

    echo creating ssh folder and authorized_keys
    sudo bash -c "mkdir -p /home/$i/.ssh"
    sudo bash -c "chmod 700 /home/$i/.ssh/"
    sudo bash -c "chown $i:$i /home/$i/.ssh"
    sudo bash -c "touch /home/$i/.ssh/authorized_keys"
    sudo bash -c "chmod 644 /home/$i/.ssh/authorized_keys"
    sudo bash -c "cat $key >> /home/$i/.ssh/authorized_keys"
done