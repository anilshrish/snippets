Create LXC container:

  ```sudo lxc-create -n <container-name> -t <template>```
  
Example:

  ```sudo lxc-create -n ubuntu01 -t ubuntu```

Starting Containers after creating the containers, start it using the following command:

  ```sudo lxc-start -n ubuntu01 -d```

Now, log in to the container with command:

  ```sudo lxc-console -n ubuntu01```

lxc download from template:

  ```sudo lxc-create -t download -n <container-name>```

      centos 7 amd64

LXC shutdown:

  ```sudo lxc-shutdown -n <containername>```
  
  ```sudo lxc-stop -n <containername>```

LXC attach to container7:

  ```lxc-attach -n <containername>```

LXC clone:

  ```sudo lxc-clone -o p1 -n centos7```
