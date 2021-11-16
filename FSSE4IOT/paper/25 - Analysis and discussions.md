## Communication protocols

## Why TinyML?

The advantages of a TinyML architecture are of course energy efficiency and low cost which is derived from the spread of iot and reprogrammability of devices. another advantage is the system reliability and data security because too much communication is energy consuming, so it's better to perform computation on end systems having fewer transmission which comports more reliability because we can use more sophisticated solutions for avoiding hacking attack by the fact that we transmit fewer data; this will of course reduce latency.
On the other hand, identified challenges are related to the eterogenity as there are much different frugal object running different protocol;. from the producer prespective, those object must support a straight ML integration, local data security (they don't want an hacker have easy access to data stored by exploiting the hardware vulnerabilities as in the Miriai Botnet attack of 2016 ); from the cloud prespective, they should be able to support api for an efficent exange of data beetween devices, and guarantee Reliability in case of failure. 

The evolution of tinyML paradigm will bring a wide range  of usefull application, for exaple wearables, such as fitness monitors or “smart” watches are not that smart by now, as they rely on a Bluetooth-coupled smartphone which assumes the majority of processing tasks. Integrating ML within frugal objects permits their independence from a master device, which will notably enrich current applications landscape. It can improve Health monitoring applications, augmented reality, real-time voice recognition, language translation, Smart cities or cognitive buildings, current IoT-based monitoring and surveillance systems, Smart Agriculture and Farming, Industry and at least cooperative-Intelligent Transportation Systems (C-ITS) will be enriched.
![[Pasted image 20211101163107.png]]

________________________________________________________________________

The availability of multiple RATs embedded in the device is also one of its key characteristics. WiFi or Bluetooth are the most usual technologies as they are very well-known standards that can reach high data-rates. Other options based on cellular communications such as 4 G/5G may be also considered. However, all these RATs require great amount of energy to work. For that reason, LPWAN-based solutions such as LoRaWAN, Sigfox, or Narrow Band—Internet of Things (NB-IoT)  are currently being adopted by the IoT market as they provide very long transmission distances with highly reduced energy consumption, although with the limitation of severely limiting the transmission rate.



Continued progress is limited by the lack of a widely accepted benchmark
for these systems because Benchmarking allows us to measure and thereby systematically compare, evaluate, and improve the performance of systems and is therefore fundamental to a field reaching maturity. [1] To make an example: a workaround for the problem of power consumption is  MLPerf Tiny, the first industry-standard benchmark suite for ultra-low-power tiny machine learning systems. [2]

A problem that general NN model must face is that different users have different patterns, and the model needs to be updated with field data on the fly. 
A tinyOL system can be attached to an existing NN in MCUs as a new layer or replace a specific layer in the NN. It will process datastream to accomodate many MCUs constraints line data storage or computation overhead, and consequentially the battery consumption too.  [6]

