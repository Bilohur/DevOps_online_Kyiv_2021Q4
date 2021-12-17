## Networking with Linux
### 1. Create virtual machines connection according to figure 1:
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/box.png)
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/box2.png)
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/box3.png)
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/box_4port_forwaring_rules.png)

### 2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).
Adding ip address VM1 and VM2:

VM1: `sudo ip link set enp0s8 up` and `sudo ip addr add 192.168.1.1/255.255.255.0 broadcast 192.168.1.255 dev enp0s8` <br/>
VM2: `sudo ip link set enp0s3 up` and `sudo ip addr add 192.168.1.2/255.255.255.0 broadcast 192.168.1.255 dev enp0s3` <br/>
add default route for VM2 : `sudo ip route add default via 192.168.1.1` 

![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/vm_1new.png)
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/vm2_ip.png)
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/vm1_interfaces.png)

Changing ip address if needed: `sudo ifconfig enp0s8 192.168.1.1/24` <br/>

Check ip forwarding status - `sysctl net.ipv4.ip_forward` or `cat /proc/sys/net/ipv4/ip_forward`<br/>
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/sysctlconf.png)
Enable ip forwarding: 
`sysctl -w net.ipv4.ip_forward=1` or `echo 1 > /proc/sys/net/ipv4/ip_forward` or change net.ipv4.ip_forward=1 in etc/sysctl.conf <br/>
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/forwarding_3.png)

Enable NAT: 
`iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE`
- where enp0s3 is interface, which has Internet access<br/>
Masquerade (changing machine address to new address of machine, which does masquerade): <br/>
`iptables -A FORWARD -s 192.168.0.0/24 -j ACCEPT` - enable packets sending from local network<br/>
`-A FORWARD -i enp0s8 -o enp0s3 -m state --state RELATED,ESTABLISHED -j ACCEPT` <br/>
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/masquerade.png)

![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/iptalbes.png)

--state -list of filtered conditions. <br/>
* ESTABLISHED - the packet belongs to an already established connection, through which packets go in both directions. 
* NEW - the packet opens a new connection or belongs to a unidirectional flow (up to this point in time). 
* RELATED - the package belongs to an existing connection, but at the same time it opens a new connection. An example of this is transferring data over FTP or issuing an ICMP message about a connection creation error, which should have been associated with an existing TCP or UDP connection. <br/>

### 3. Check the route from VM2 to Host.
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/route.png)

### 4. Check the access to the Internet, (just ping, for example, 8.8.8.8).
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/ping.png)
### 5. Determine, which resource has an IP address 8.8.8.8.
### 6. Determine, which IP address belongs to resource epam.com.

![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/host_.png)

### 7. Determine the default gateway for your HOST and display routing table.

![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/gateway.png)

### 8. Trace the route to google.com.
![img](https://github.com/Bilohur/DevOps_online_Kyiv_2021Q4/blob/master/m6/task6.1/Screenshots/route_google.png)
