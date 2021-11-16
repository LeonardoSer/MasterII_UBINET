# 01 - Mobility
## Issue w/ mobility
1. **Find Someone** -> IP is a locator and ID is a Identificator, DNS does not scale to frequent update of <IP, ID> tuples
3. **Mantain Location** -> TCP/UDP are not possible (end to end protocols)


## Mobility approaches
1) Let **Routing** handle it -> fixed IP (like infrastracture in japan to handle earthquakes)
2) Let **end-System** handle it -> Direct routing and Indirect Routing 

![[Pasted image 20211103104128.png]]

**Advantages**: privacy (sender knows only home address)
**Disadvantages**: a msg must travel 4\*diameter* if you and the receiver are in the same position 

![[Pasted image 20211103104337.png]]

**Advantages**: a msg travel at most 2\*diameter

## Wireless Networking
- **Infrastracure based** : all traffic pass through services like Routing, Dns, .... following the end-to-end principle (no packet stored in router)
- **Ad hoc** packets travel direclty from node to node

![[Pasted image 20211103105016.png]]

### issues (wirless vs wired)
- Signal strenght decreasing 
- Interferences from other sources
- Multipath propagation: radio signal reflect off object
- other ![[Pasted image 20211103105311.png]]


### IEEE 802.11
#### CSMA/CA
Collision Avoidance but no detection
- In **DIFS** check if the network is occupied, **SIFS** is the same but shorter
- if the sendere doesn't receive and ack then there is a collision

To avoid lost of big packet we can use **Request-to-Send (RTS)** and **Clear-to_Send (CTS)**. 
If **RTS** collides, sender must wait random time to send it again

#### 802.11 frame 
![[Pasted image 20211103110423.png]]
![[Pasted image 20211103110435.png]]

#### Rate Adaptation
![[Pasted image 20211103110753.png]]
- Decreasing the BIT RATE, the BER Decrease (like speaking slowly in a noisy room)

## Manet
- Every node can be a router, so every router have a single interface (one IP)
- Dinamic Topology
- we can use both:
	- **Source Routing** path computed at sender (no routing tables)
	- **Hop-by-Hop Routing** routing decision made hop by hop
![[Pasted image 20211103111155.png]]

### Manet Protocols
can be both
- **Reactive** path computed only if asked for
- **Proactive** nodes continously computes routes

#### OLSR protocol (Optimized Link State Routing )
- Proactive and hop-by-hop
- Nodes get info only from neighbors
- **Multy point Relays** -> **MPR(i)** are the set of 1-Hop neighbors wich span all the 2-hop neighborhood. using them reduces flooding
- **Multy Point Selector Set** -> **MS(i)**  set of nodes that have **i** as **MPR**
-  **Hello msgs** used to determine MPR sets
- **Topology control ->TC msgs** used to send topology infos from MPR to their MS. only MPR propagates TC 

#### AODV ( Ad hoc On-demand Distance Vector routing protocol)
Pure **On-demand routing protocol **
- A node does not perform route discovery or maintenance until it needs a route to another node or it offers its services as an intermediate node 
-  Nodes that are not on active paths do not maintain routing information and do not participate in routing table exchanges
-  Dynamic routing tables are stored in intermediate node on active paths 
-  Every node has **{Node sequence number,  Broadcast ID}**

**RREQ msg** -> To request a route this msg is Broadcasted
	- **Sequence number** -> used to indicates freshness of the path
	- **(source_addr, broadcast_id)** uniquely identifies the RREQ 
		- broadcast_id is incremented for every RREQ packet sent 
		- Receivers can identify and discard duplicate RREQ packets
![[Pasted image 20211103113746.png]]

**RREP msg** -> send bakc when RREQ rach a node who knows the destination 
	- Hop_count needed to choose among multiple RREP msgs
	- if an error is detected by a node, he replies with a RREP with Hop_count = infinite
![[Pasted image 20211103114319.png]]

## Distance Vector vs Link state
Both allow a router to find global routing information
Both algorithms assume that a router knows 
	-  the address of each neighbor
	-  the cost of reaching each neighbor

## distance-vector algorithm
A node tells its neighbors its distance to every other node in the network

**ISSUE** -> **count-to-infinity problem.**:  when a node updates and distributes a distance vector, it hides the sequence of operations it used to compute the vector.

## link-state algorithm
a node tells every other node in the network its distance to its neighbors

# 02 - Challenged Networks
- Intermittent Connectivity may appear because of:
 	- Propagation effects, shadowing, deep fades 
 	-  Mobility: paths change too fast; huge overhead for maintenance 
 	-  Power: nodes shut down to save power or “hide” (doesn’t collaborate)
 
 ## Delay tolleran networking (DTNs)
 
 Internet assumption are violated:
 - Continuous, bidirectional end-to-end path 
	 -  Intelligence at the edge, protocols are “conversational”
-  Short round-trips 
	-   TCP congestion control: receive ACK to send next packet 
-  Low error rates

## Store-Carry-and-Forward (Mobility-assisted) Routing
**IDEA** An intermediate node store data until there is a path to reach the destination node

## Types of Contacts 
- **Scheduled contacts**  (deterministic)
	-  e.g. satellite links, bus routes 
	-   enforced contacts: robots, message ferries (more later) 
	-   all info known (complete knowlede)
-    **Probabilistic contacts **
	- statistics about contacts known 
	-    e.g. mobility model, or past observation+prediction 
	-     sensors with random wake-up schedule 
- **Opportunistic contacts **
	- not known before it occurs 
	- e.g. a tourist car that happens to drive by the village

## Routing w/ predicted contacts (deterministic and probabilistic)

### Routing w/ complete knowledge
Delays can be: 
- Time till the contact (or link) is up again 
- Transmission 
- Propagation 
-  Queuing = Waiting for queue to drain

**Link weight** -> w(e,t) = message arriving at edge e at time t, is predicted to arrive at end of e at time t + w(e,t)

Need to compute **Min wighted Shortest Path**, with 2 approach
	1. **Minumum Expected Delay (MED)** -> Dijkstra with edge delay equal to average inter-machine time
		- practical version -> **Minumum Estimated Expected Delay (MEED)**  
			-it mantain history of past contact, has a **Link-State epidemic dissemination** 
			- when a contact changes significatively then flood Topology Update packets
	2. Modified Dijkstra w/ time varying costs
	
### Message Ferrying
- Network of **Production** nodes, where nodes can be both static and mobile 

*How enforce the contacts?**
- Use some nodes to carry traffic beetween production nodes: **Data Mules** and **Message Ferries**
- i muli sono macchine (UAV) con internet

**ISSUE**: design optimal trajectories
	
## Opportunistic Routing with Unknown Contacts
### Epidemic Routing
Give a message copy to every node encountered essentially: flooding in a disconnected context, so Exange of message vectors

How many transmissions? 
- At least N (number of nodes) 
-  All nodes receive the message 
What is the delay?
-  Minimum among all possible routing schemes 
-  If NO resource constraints (bandwidth, buffer space) 
-   Otherwise it is bad … (too many replicas)

#### Epidemic Routing Performances
- Redundant copies reduce delay 
-  But: too much redundancy is wasteful and often disastrous (due to contention)

A solution is **Controlled Replication (“Spraying")**, limit the number of replicas
Another **Spray and Wait (Binary Spraying)**
![[Pasted image 20211103135011.png]]

## Prophet Routing: Route by estimated delivery probabilities

opportunistic routing that mantain the probability of meeting of any couple of node:
- Probability exponentially decays with elapsed time 
- Increases when i and D meet 
- Updated when another node than D is met: p(i,D) = f(p(i,j),p(j,D)) Transitiveness of probability – kind of path probability

## Mobility Model:
- **Random Walk** : at every step you choos a direction w/ equal probability (future indipendent from the past) ![[Pasted image 20211103150807.png]]
- **Random Waypoint** :  Repeat: Choose a point in the network uniformly -> Choose speed randomly -> Pause for a random amount of time ![[Pasted image 20211103150748.png]]

## Scheduling and Drop in DTNs

**ISSUES**:
- Also if the number of copies is limited, which message to drop in case of congestion ?
- Contact times can be shorter than what is needed to exchange messages between nodes. is there a way to forward the most useful messages first ?

### State of the art
1) Mostly used policies: Drop Tail for queue management and FIFO for scheduling
2) Better delivery rate and delivery delay with Drop Front -> There is a high chance that messages at the head have more copies

# 03 - Transport and Congestion Control in the Internet
transport protocols provide logical communication between application processes running on different hosts and runs in end systems:
- send side: breaks app messages into segments, passes to network layer 
- receiver side: reassembles segments into messages, passes to app layer

**network layer**: logical communication between hosts 
**transport layer**: logical communication between processes

## TCP vs UDP 

![[Pasted image 20211104113039.png]]
 - reliable, in-order delivery (TCP) 
	 - congestion control 
	 -  flow control 
	 -   connection setup 
- unreliable, unordered delivery: UDP 
	-  No functionality extension of “best-effort” IP 
- services not available in the Internet 
	-  delay guarantees 
	-   bandwidth guarantees

## Socket
A socket is a software abstraction, designed to provide a standard application programming interface (API) for sending and receiving data across a computer network

**Multiplexing**: gather data from applications and send them to the network **Demultiplexing**: receive data from the network and pass them to the applications

**ports** 16 bit -> 0 to 65535 (Ports from 0 to 1023 are reserved ports)

## UDP
-  Multiplexing/demultiplexing
-  Basic error checking -> UDP Checksum
-   “best effort” service, UDP segments may be: 
	-  lost delivered out of order to app 
-  connectionless: 
	-   no handshaking between UDP sender, receiver 
	-    each UDP segment handled independently of others

## TCP
full duplex data: 
	- bi-directional data flow in same connection
connection-oriented:
	- Three-way handshake 
	- No state in the routers, only on the sender and receiver 
flow controlled
	- sender will not overwhelm receiver 
Congestion control
	- Sender will not overwhelm network
	
## TCP Segment 
![[Pasted image 20211104120331.png]]

Source port (16 bits)
Destination port (16 bits)
Sequence number (32 bits)
ACK number (32 bits)
Header length (4 bits)
Flag fields (6 bits, 1 bit per flag)
	- ACK bit set: the value contained in the ACK field is valid. Allows piggybacked ACK
	- RST/SYN/FIN: used for connection establishment and teardown (discussed later)
	- PSH bit set: receiver should pass data to the upper layer immediately 
	- URG bit set: specify that this data is urgent. The location of the last byte of this urgent data is specified by the 16 bits field Urgent Data Pointer. In practice the URG pointer is not used
Urgent Data Pointer (16 bits)

**Piggybacking** return ACK in another segment instead of alone

### Out of order segments
Two approaches possible :
1. Discard at the receiver all the out of order segments
	-  Not efficient because the segments are correctly received, but needs to be retransmitted simply due to an out of order reception 
2. Keep the out of order segments and wait for the missing segments to deliver the data to the application 
	– Approach taken in practice in TCP
	
### Reliable Data Transfer
- TCP creates a reliable service on top of IP’s unreliable service
- **Pipelined segments** -> Multiple transmitted segments not yet ACKed at the same time
- Cumulative positive ACKs
- Retrasmission timer
- Retrasmission is triggered by **duplicated acks** and **timeut events**

### TCP flow Controll
- to avoid overflow at the receiver buffer. just put a fucking RCVwindow

## Congestion Control 
“too many sources sending too much data too fast for network to handle”
it's differnt from Flow Control (which is end to end)

manifestations:
- lost packets (buffer overflow at routers)
- long delays (queueing in router buffers)

### Solutions to Congestion Control
1. End-end congestion control: 
	- no explicit feedback from network 
	- congestion inferred from end-system observed loss, delay 
	- approach taken by TCP 
	- Does not require any change to intermediate routers
	
2. Network-assisted congestion control: 
	- routers provide feedback to end systems 
		- single bit indicating congestion (SNA, DECbit, TCP/IP ECN, ATM) 
		- explicit rate sender should send at (XCP) 
	- Its major drawback is that it requires changing everything

### TCP congestion control 
- **Probing for bandwidth** -> increase trasminssion rate until a loss occurs, the decreasse it
- ** Slow Start** ->
	-  TCP slow start is one of the first steps in the congestion control process. It balances the amount of data a sender can transmit (known as the congestion window) with the amount of data the receiver can accept (known as the receiver window). 
	-  The lower of the two values becomes the maximum amount of data that the sender is allowed to transmit before receiving an acknowledgment from the receiver.
	- As TCP relies on the received ACKs to increase its congestion window, one say that TCP is self clocked

### Throughput TCP
![[Pasted image 20211104124238.png]]
![[Pasted image 20211104124326.png]]
![[Pasted image 20211104124338.png]]

**Square root formula** does not work when p is high:

# 4 Addressing Interdomain Routing 
- Names are long and human understandable 
	-  wastes space to carry them in packet headers 
	-   hard to parse 
- Addresses are shorter and machine understandable 
	-  if fixed size, easy to carry in headers and parse 
-   Indirection 
	-    multiple names may point to same address 
	-     can move a machine in same domain and just update the resolution table
	
## Classful addressing 	
1. Class A -> 8 bits of network number
2. Class B -> 16 bits of network number 
3. Class C -> 24 bits of network number

Alternatives
1. dynamic host configuration 
2. subnetting 
3. CIDR
4. IPv6

## Dynamic host configuration 
Allows a set of hosts to share a pool of IP addresses.
Need a Dynamic Host Configuration Protocol (DHCP) 
- Newly booted computer broadcasts discover to subnet 
- DHCP servers reply with offers of IP addresses 
- Host picks one and broadcasts a request with the name of a particular server 
- All other servers “withdraw” offers, and selected server sends an ack 
- When done, host sends a release 
- IP address has a lease which limits time it is valid 
- Server reuses IP addresses if their lease is over (LRU is wise)

## Subnetting 
Allows administrator to cluster IP addresses within its network 
- 256 subnet of 256 addresses (e.g. an Ethernet segment) 
- saves space and computation time in subnet routing tables 
- subnet masks are not visible outside the network

## CIDR : Classless Interdomain Routing 
Class based scheme forced medium sized nets to choose class B addresses, which wasted spaces because the address space exhaustion (214 = 16382 class B addresses) 

Solution -> allow ways to represent a contiguous set of class C addresses as a block, so that class C space can be used, using a CIDR mask to represent the block 

Idea is very similar to subnet masks, except that all routers must agree to use it 
Associate to prefixes a length indication: the number of bits of the network number part

# IPv6
32-bit address space is likely to eventually run out 
IPv6 extends size to 128 bits (16 bytes)
# DNS (Domain Name System)
**ISSUE** -> Root servers overloaded
- Caching is also used to reduce load on root servers
- Root servers are replicated

# ARP 
To get datalink layer address of a machine on the local subnet broadcast a query with IP dest address onto local LAN (All hosts are required to listen for ARP requests and reply). 

then Reply stored in an ARP cache and timed out, so you can ask to it instead of broadcasting 

# Routing Protocol 
## Requirements
Minimize routing table space 
	- fast to look up 
 	  less to exchange
Robustness to avoid black holes, loops and oscillations 

## Choiches 
centralized or distributed routing?
source-based or hop-by-hop?
stochastic or deterministic?
Single or multiple path?
state-dependent(dynamic) or not?

## Routing algoritm in case of unrealiable links 
- links and routers unreliable : dynamic routing needed 
- alternative paths scarce : single path deterministic routing 
- traffic patterns can change rapidly : oscillation risk
- Both algorithms assume router knows address of each neighbor cost of reaching each neighbor

### Distance vector routing
- Node tells its neighbors its best idea of distance to every other node in the network
- Updates its notion of best path to each destination, and the next hop for this destination
- A Distance vector is different from routing table beacause they have the cost of the link 
- Uses **bellman and ford**

In distance vector, router knows only cost to each destination 
	- hides information, causing problems 
	- **ISSUE** cunt to infinity loop -> Potential problems when links go down or come up: DV approach hides details to compute the vector, Therefore loops can occur

A solution can be **DUAL (Distributed Update ALgorithm)**
- Avoids loops even in presence of rapid changes

## Link state routing
router knows entire network topology, and computes shortest path by itself
Key elements:
- topology dissemination 
- computing shortest routes

### Topology dissemination
A router describes its neighbors with a link state packet (LSP) and Use controlled flooding (where Root sends back the LSP) to distribute this everywhere
Building LSP DataBases
![[Pasted image 20211104224117.png]]

uses **Sequence numbers** to purge old LSP


But, on boot up (link can go down for a while and came back later) , what should be the initial sequence number?
have to somehow purge old LSPs two solutions 
- **aging** 
-  **lollipop-space sequence numbers**

#### Aging
Source of LSP puts timeout value in the header and Router removes LSP when it times out -> What timeout should we choose? a solution is the following: ![[Pasted image 20211104224514.png]]

#### Lollipops 
Additional rule: if a router gets an older LSP, it tells the sender about the newer LSP sequence number So, newly booted router quickly finds out its most recent sequence number

**Recover from broken LSP databases partitions** Routers on each side of a newly restored link exchange database descriptors to update databases (determine missing and out-of-date LSPs)

**Detect link or router failure**:  HELLO protocol -> Neighbor floods information about router failure if no response to N HELLO packet

### Computing shortest paths

Based on Dijkstra’s shortest path algorithm

## LINK STATE vs DISTANCE VECTOR

LINK STATE ->Topology information is flooded within the routing domain plus  Best end-to-end paths determine next-hops.
DV -> • Each router knows little about network topology plus Best end-to-end paths result from composition of all next-hop choices

![[Pasted image 20211104225012.png]]

## Choosing link costs
may change over time
for Shortest path link cost can be both static or dynamic
1. Simplest: set all link costs to 1
2. Enhancement: give links weight inversely proportional to capacity ![[Pasted image 20211104225206.png]]

### Dynamic Metrics
- Cost proportional to length of router queue
	-  independent of link capacity
	-  some issues: ![[Pasted image 20211104225419.png]]
- new approach:
	- queue length averaged over a longer time
	- dynamic range restricted (3:1), cost hop normalized
	- cost also depends on intrinsic link capacity (on low load cost depends only on capacity)
	- TOO COMPLEX CAZZO DI DIOCANE ![[Pasted image 20211104225615.png]]

## Interdomain Routing and BGP
interdomain mean collection of router that implemente a Rounting policy 
 
 ### Internet Hierarchy
 Autonomous System (AS) is set of router using intra domain routing protocol inside the AS and inter domain protocol outside the AS. Each AS is assigned a unique ID
 
 ### transit vs peering (inter domain relationship)
 transit -> within ISP father and sons
 Peering  -> within same level ISPs
 
 ### BGP: Distance Vector with Path
 Each routing update carries the entire pat (destination 18.26/16 is reachable using {AS1, AS3, AS11})
 Auto reject router with loop
 AS can decide to dont tell you tthat he has the path to a host X also if he has ( What happens if an AS advertises routes that it doesnIt use?)
 
 #### Neighbors in bgp
 - External Neighbor (eBGP) in a different Autonomous Systems _
 - Internal Neighbor (iBGP) in the AS1 same Autonomous System

#### iBGP
iBGP is run between BGP routers in the same AS to allow all of them to obtain a complete and consistent view of external routes