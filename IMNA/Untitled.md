## The Phone System
– Focus on the wires

• a call is a “circuit” not a “conversation”
• a phone number is a program to build the path not the callee address (**Revenue comes from path construction**)

**Single basic service**: two-way voice
– low end-to-end delay
– guarantee that an accepted call will run to
completion

**Endpoints connected by a circuit**
– like an electrical circuit
– signals flow both ways (full duplex)
– associated with bandwidth and buffer
resources

### Synchronous transmission Multiplexing (STM)
- Neither multiplexor nor demultiplexor needs
addressing information (why?).  requires however accurate timing information.

**ISSUE**:
– idle users consume bandwidth (STM is
inefficient)
– Arbitrary schedules result in complicated
operation
– STM service is inflexible

**Solution to ISSUE**
- use packets instead
– meta-data (header) indicates src/dest
-> **ATM and IP**

## The ATM network
– Focus on virtual circuits (VCs)
 
Uses IDENTIFIER pre-enstablished, IDs must be switched in intermediate points (switcheswith translation table)

**ISSUES**
- All packets must follow the same path
- Switches store per-VC state (entry in translation table)
- separation of data and control (control in software over slow time scale, data transfer in hardware)
- Virtual circuits do not automatically guarantee reliability (packet loss)
- Small Identifiers can be looked up quickly in hardware (cant do it with IP)

**PROs**
- Simpler buffer hardware
– Simpler line scheduling
– Easier to build large parallel packet switches
- The smaller the packet, the larger the header overhead
**CONs**
– If the chosen size < ADU => overhead
– segmentation and reassembly cost
– last unfilled cell after segmentation wastes bandwidth

**How do ATM networks allow for integrated service (voice, video, and data traffic on separete networks)?**
– lots of (switching) capacity: hardware-oriented switching
– support for different traffic types
		- signaling for call set-up
		- admission control, Traffic descriptor, policing
		-  resource reservation
		-  requires intelligent link scheduling for voice/data integration
		(more flexible than telephone because of headers)

## The Internet today
– Focus on the endpoints



## The future Internet
– Focus on the data

Two global namespaces: DNS and IP addresses

**What holds the Internet together?**
Addressing
– how to refer to a machine on the
Internet
Routing
– how to get there
Internet Protocol (IP)
– what to speak to be under

**architectural problems**
Hosts are tied to IP addresses
– Mobility and multi-homing pose problems
Services are tied to hosts
– A service is more than just one host: replication, migration, composition

### Datagrams
– Fairly share the path
**CONTS**
– Using the wires differently from phone system
-- No set up phase

### TCP/IP
- Reliability increases exponentially with the system size
- No call setup

When TCP was invented there were a lot of users per machine Now there is a lot of machines per user with data to be synchronized and shared

# Content Centric Networking (CNN)

A **networking** paradigm that emphasizes **content** by making it directly addressable and routable.

There are two CCN packet types:
interest (similar to http “get”) and data (similar to http response). Both are encoded in an efficient binary XML.

## Software Defined Networking
- • SDN comes from the IT world: 
- – Separate the data and control layers, while centralizing the control 
- – Deliver the ability to program network behavior using welldefined interfaces

Death to the Control Plane!
• Simpler management – No need to invert control-plane operations 
• Faster pace of innovation – Less dependence on vendors and standards 
• Easier interoperability – Compatibility only in wire protocols
• Simpler, cheaper equipment – Minimal software

Extreme: What if software decides whether to accept each flow, and how to route it?
How many $400 servers do we need for 35,000 users?
Answer: 15 less than one -> If we can define network operation outside the datapath, then eventually we will. With replication for fault-tolerance and performance scaling.


With SDN it seems like we should be able to: 
1. Formally verify that our networks are behaving correctly. 
2. 2. Identify bugs, then systematically track down their root cause.

Why debugging networks is hard Complex interaction 
– Between multiple protocols on a switch/router.
– Between state on different switches/routers. 
Multiple uncoordinated writers of state. Operators can’t… 
- Observe all state.
– Control all state.

Conclusion on SDN 
– Open interfaces to the data plane 
– Separation of control and data 
– Leveraging techniques from distributed systems

## OpenFlow Networks

# NFV 
A means to make the network more flexible and simple by minimising dependence on HW constraints

- implementing network functions in software
- allows use of a single physical platform for different applications
- Reduced equipment costs 
- Improved operational efficiency
- Reduced (OPEX) operational costs: reduced power, reduced space, improved network monitoring

NFV challenges
- high performance virtualised network appliance
- Co-existence with bespoke HW based network platforms
- • Management and orchestration of virtual network appliances 
- • Appropriate level of resilience to HW and SW failures

# Service Fonctions Chaining (SFC)

• Set of network services, such as firewalls or application delivery controllers interconnected through the network to support an application