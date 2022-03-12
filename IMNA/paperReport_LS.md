# Report paper IMNA - Leonardo Serilli


## (A) paper contribution and strengths

The paper present a new solution for **Programmable packet scheduling**, a way of enables scheduling alghoritms to be implemented into the data plane without the need of changing the undelying hardware platform. The solution presented is called **Admission-In-First-Out (AIFO)**. 

Based on a FIFO queue AIFO associate a rank to each packet, in order to accept or drop incoming ones, plus by design it supports **starvation prevention** and **eliminates packet reordering**. 

The solution is motivated by two trend factors in datacenter networking: **shallow buffers in switches** and **fast-converging congestion protocols in end hosts**. 

In my opinion usually the research activity come up with brilliant solutions, unfortunately without taking in consideration the **reusability** of already existing hardware structures, while the rethinking of already existing platforms would bring non negligeble **overhead to the implementation** of those solution. On the other hand, this research, has in his main goals the **minimization of hardware requirment** to implement the solution on the data plane of existing hardware. 




## (B) potential paper weaknesses and enhancement possibilities 
The theoretichal part require a deep self made analysis to be comprehended and no insight is given on mathematical equations.

On the other side, some easy graspable concept is over explained or repeated too much, slowing down the reading of even bringing to a misleading comprehension of the text, as an example: self-explainig images are too deeply analyzed. 



## (C) Whether you think the results are reproducible and why 
AIFO has been prototyped and tested. In the work is presented a **deep performance analysis** of it, along with **comparisons with other scheduling known strategies**. Given the fact that the algorithms has been designed to minimize hardware requirments allowing an easy implementation on already existing switches, the experimental analysis can be so easily set up again. 