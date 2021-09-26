# FFS4IOT Report Lab 1: What is the effect of environment on propagation ?
- Alessio di Dio
- Loris Onori
- Valerio Lionetti
- Leonardo Serilli

## Introduction
A wireless communication uses electromagnetic waves to
transmit information, by their nature those waves are affected by different phenomena as environmental noises, multiple kinds of **attenuations**, such as **distance attenuation**, **infrastuctural shadowing**, given by the presence of big ostacles such as hills or buildings, or **multipath effec** given by obstacles on the path that causes the receiver to get multiple signals shifted in time, and also the **interference with trasmissions** both in near frequencies or in the same bandwidth .

## Lab session 
Along the last lecture lab session **(21/09/2021)**, we have tested a wirless propagation between two devices, based on arduino microcontroller, both supplied with a miniaturized Antenna .

### Outdoor 

The **Transmitter**, placed in the middle of the campus, was comunicating with our **Receiver** that we hanged around while measuring the trasnmission power level thanks to 20 leds, installed on the device, which represents the power loss during transmission. 

We noticed that, while moving on a straight line without obstacles, the loss was constantly increasing but as soon as a building, or even group of people, was beetween us and the Transmitter the loss increased a lot, even near the transmitter. 

We want to point out that even by covering with the hand the receiver's antenna brings a significant change in the trasmittion power loss.

#### Measurments

| index | meters | leds on |
|-|-|-|
|(1)|2|12|
|(2)|10|11|
|(3)|17|9|
|(4)|60|10|
|(5)|140|6|
|(6)|165|4|
|(7)|180|1|
|(8)|215|0|
|(9)|225|2|
|(10)|275|0|
|(11)|295|2|
|(12)|330|3|
|(13)|390|2|
|(14)|450|3|
|(15)|510|0|

#### graphical representation

![[photo_2021-09-22_17-00-53.jpg]]

#### satellite view

![[photo_2021-09-22_16-06-40.jpg]]

### Indoor 

In this step the Trasmitter was placed in classroom and we measured the signal power in the same floor of the same building. 

We have noticed that enviroment affects the signal much more than outdoor; in fact we have seen a relevant oscillation in the signal even standing in the **same position. **

#### Measurments

| index | meters | leds on |
|-|-|-|	
|(1)|3|from 17 18|
|(2)|11|from 2 to 6|
|(3)|15|from 3 to 7|
|(4)|20|from 0 to 5|

#### graphical representation

