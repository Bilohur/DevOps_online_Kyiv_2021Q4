# TASK 5.3 Bilohur Oleksii
## Part 1
### 1. How many states could has a process in Linux?
There is 5 possible process states in Linux:
D – Uninterruptible sleep (usually a critical system process, a process that cannot be killed without rebooting)
R – Running or runable (on run queue)
S – Interruptible sleep (waiting for an event to complete)
T – Stopped, either by a job control signal or because it is being traced.
Z – Defunct (“zombie”) process, terminated but not closed by the parent process that created it

### 2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.
pstree command show processes in such way that you can immediately see which process is the parent of which
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.2.png)
### 3. What is a proc file system?
pcocfs is virtual file system created on fly when system boots and is disappears while shutdown. <br/>
It contains useful information about the processes that are currently running, it is regarded as control and information center for kernel.<br/>
It also provides communication medium between kernel space and user space.
### 4. Print information about the processor (its type, supported technologies, etc.).
``cat /proc/cpuinfo`` 
``lscpu``
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.4.png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.4(1).png)
field 'flags' shows supported technologies, processor type is shown at 'model name' field
### 5. Use the ps command to get information about the process. The information should be as <br/>
follows: the owner of the process, the arguments with which the process was launched for <br/>
execution, the group owner of this process, etc.
``ps -au``
``ps -o user,pid,group,args,%cpu,%mem``
### 6. How to define kernel processes and user processes?
All kernel threads are descendants of kthreadd (pid 2), which is spawned by the kernel (pid 0) during boot.
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.6(1).png)
Defining the kernel processes could be done with `ps -aux` command - name of these processes will be between square brackets.
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.6.png)

### 7. Print the list of processes to the terminal. Briefly describe the statuses of the processes. What condition are they in, or can they be arriving in?
`ps -aux` or `ps -eo pid,comm,stat`
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.7.png)
D – Uninterruptible sleep (usually a critical system process, a process that cannot be killed without rebooting)
R – Running or runable (on run queue)
S – Interruptible sleep (waiting for an event to complete)
T – Stopped, either by a job control signal or because it is being traced.
Z – Defunct (“zombie”) process, terminated but not closed by the parent process that created it

### 8. Display only the processes of a specific user.

`ps -aux | grep user` or `ps -au user`
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.8.png)

### 9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps
command)?
ps show only running process:
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.9.png)
In `man ps` paragraph SEE ALSO tells about another 4 utilities - pgrep(1), pstree(1), top(1), proc(5) for analyzing running tasks

### 10. What information does top command display?
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.10.png)
At the top of the screen displayed:<br/>
**System Uptime and Load Averages**: This is a single line that contains the program name (top), the current time, length of time since last boot, total number of users and the system load average over the last one, five and fifteen minutes.

**TASK and CPU States**: This consists of a minimum of two lines. The first line shows the total tasks or threads (depends on the state of the Threads-mode toggle). This is then further classified into either running, sleeping, stopped or zombie (zombie processes are processes that have been terminated or are finished executing but have not been properly disposed). The second line shows CPU state percentages since the last refresh. The state percentages refer to:
us, user : time spent running user processes that haven’t had their priority changed with the ‘nice’ command
sy, system : time spent running kernel processes
ni, nice : time spent running user processes that have been ‘niced’
wa, IO-wait : time waiting for I/O completion
hi : time spent on hardware interrupts
si : time spent on software interrupts
st : time taken from this virtual machine by the hypervisor.

**Memory Usage**: This consists of two lines which show the memory use in kibibytes(KiB). Recall that 1 KiB = 1024 bytes, and 1 MiB = 1024 KiB, and so on (in contrast to 1 KB = 1000 bytes, and 1 MB = 1000 KB). Line 1 shows physical memory while line 2 shows virtual memory (swap).
https://www.maketecheasier.com/linux-top-explained/

Columns info can be shown be typing F and toggles for display:<br/>
PID: Process ID.<br/>
USER: The owner of the process.<br/>
PR: Process priority.<br/>
NI: The nice value of the process.<br/>
VIRT: Amount of virtual memory used by the process.<br/>
RES: Amount of resident memory used by the process.<br/>
SHR: Amount of shared memory used by the process.<br/>
S: Status of the process. (See the list below for the values this field can take).<br/>
%CPU: The share of CPU time used by the process since the last update.<br/>
%MEM: The share of physical memory used.<br/>
TIME+: Total CPU time used by the task in hundredths of a second.<br/>
COMMAND: The command name or command line (name + options).<br/>

### 11. Display the processes of the specific user using the top command.
``top -u username``<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.11.png)

### 12. What interactive commands can be used to control the top command? Give a couple of
examples.
-A - show def, job, mem and usr panels, switch -a
-z - color mode
-W - save current interactive settings <br/>
-u - filter processes by user <br/>
-k - kill process by id <br/>
-F - choose fields for displaying<br/>
-y - select the process by which the sorting will be performed<br/>
-i - show only processes, which uses cpu resources
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.12.png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.12(1).png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.12(2).png)
### 13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.)
To sort processes using definite parameter press `F` and choose needed parameter by pressing `s`. For example sorting by RAM usage:
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.13.png)<br/>
Sorting by amount of processor time taken up:<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.13(1).png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.13(2).png)
### 14. Concept of priority, what commands are used to set priority?
Priority means that processor time will be given more to one process over another. Each process can have priority from -20 (min) to +19(max). To reduce it you don't have to be su, but to increase - must. <br/>
There is 3 ways to show priority: with `ps -o pid, nice -C mysql`, `ps -o pid, nice 697` or top.<br/>
To set priority nice command is used, example: increase: `nice -n 15 top`, reduce: `renice 11 -p 1234`.

### 15. Can I change the priority of a process using the top command? If so, how?
Yes, by pressing shift+f and then r.
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.14.png)
### 16. Examine the kill command. How to send with the kill command process control signal? Give an example of commonly used signals.
To send process control signal  need to specify signal after command `kill` and pid. Default signal is SIGTERM - lets program to finish subprocesses and free all resources. <br/>
SIGINT - interrupt process, which will properly finish all its actions(Ctrl+ c). <br/>
SIGQUIT - quit and save process to memory dump, process could finish or ignore this signal(Ctrl + /). <br/>
SIGHUP - tells process, that connection with control terminal is broken, generally, with internet. <br/>
SIGKILL - immeditely terminates the process, cannot be ignored.<br/>
SIGSTOP - stop process for resumption later.<br/>
SIGTSPT - pause process, can be ignored (Ctrl+ c). <br/>
SIGCONT - reload process which was stopped or paused with TSPT.
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.15.png)

### 17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to  demonstrate the process control mechanism with fg, bg.
jobs - show list of the tasks that is up and running, fg - to move job into foregroung(even if it is pauased), bg - to resume job in background, nohup - start processes that will be disconnected from the terminal if the terminal is closed. 
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.16.png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3.17.png)

# Part2
### 1. Check the implementability of the most frequently used OPENSSH commands in the MS Windows operating system. (Description of the expected result of the commands + screenshots: command – result should be presented)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/taskp21.png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p21.png)
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p22.png)

### 2. Implement basic SSH settings to increase the security of the client-server connection (at least
* Changing default ssh-port<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh.png) <br/>
* Generate a Key Pair for connection <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh2.png) <br/>
* Turn off password authentication  <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh3.png) <br/>
* Disallow empty passwords connections <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh4.png) <br/>
* Use ssh protocol ver. 2 <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh5.png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh.png
) <br/>
* Generate a Key Pair for connection<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh2.png
)
* Turn off password authentication<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh3.png)
* Disallow empty passwords connections<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh4.png)
* Use ssh protocol ver. 2<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh5.png)
* Restrict access from another networks except one subnet<br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2ssh5.png)
### 3. List the options for choosing keys for encryption in SSH. Implement 3 of them. <br/>
 -t dsa | ecdsa | ecdsa-sk | ed25519 | ed25519-sk | rsa <br/>
Specifies the type of key to create.  The possible values are “dsa”, “ecdsa”, “ecdsa-sk”, “ed25519”, “ed25519-sk”, or “rsa”. <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2sshkeys1.png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task53p2sshkeys2.png) <br/>

### 4. Implement port forwarding for the SSH client from the host machine to the guest Linux virtual machine behind NAT. <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3na2t.png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3nat3.png) <br/>
### 5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3tcpdumptel.png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/task5.3tcpdump.png) <br/>
![image](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m5/task5.3/Screenshots/wiresh.png) <br/>