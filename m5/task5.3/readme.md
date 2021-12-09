# TASK 5.3
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
It contains useful information about the processes that are currently running, it is regarded as control and information center for kernel.
