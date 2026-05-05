# System call traces:

## List of all system capabilities:
https://www.man7.org/linux/man-pages/man7/capabilities.7.html

```sh
strace -w --summary-only ./hello
```

Comparisson of straces:
```
$ strace -w --summary-only ./hello_world_loop 
Hello, World!
Hello, World!
Hello, World!
^Cstrace: Process 151855 detached
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
100,00   10,000481     5000240         2           nanosleep
  0,00    0,000187         187         1           execve
  0,00    0,000133          44         3           write
------ ----------- ----------- --------- --------- ----------------
100,00   10,000802     1666800         6           total


docker run --name hello_world sha256:49bc7f77639ba48513d2418f84c75efcefb116c414998a90e1fa6c6e0bc89c6c
docker inspect hello_world | jq .[0].State.Pid

$ sudo strace --attach $(docker inspect hello_world | jq .[0].State.Pid)
[sudo] password for treuhl: 
strace: Process 153528 attached
restart_syscall(<... resuming interrupted nanosleep ...>) = 0
write(1, "Hello, World!\n", 14)         = 14
nanosleep({tv_sec=5, tv_nsec=0}, NULL)  = 0
write(1, "Hello, World!\n", 14)         = 14
nanosleep({tv_sec=5, tv_nsec=0}^Cstrace: Process 153528 detached
 <detached ...>
 

 docker run --runtime=runsc --name hello_world sha256:49bc7f77639ba48513d2418f84c75efcefb116c414998a90e1fa6c6e0bc89c6c  
 
 $ sudo strace --attach $(docker inspect hello_world | jq .[0].State.Pid)
strace: Process 154687 attached
ppoll([{fd=6, events=POLLHUP|POLLRDHUP}], 1, NULL, NULL, 0
```
Extra info for ps:
```
       To get security info:
          ps -eo euser,ruser,suser,fuser,f,comm,label
          ps axZ
          ps -eM
```
