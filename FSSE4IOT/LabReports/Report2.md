-Alessio Di Dio
-Valerio Lionetti
-Loris Onori
-Leonardo Serilli

# What is the effect of bandwidth and spreading factor on air time?
## Introduction
This report is focused on a different types of modulations expecially in LoRa modulation. In the first part we will describe what the modulations is, how they work and their main features.
In the second part of the document we will describe the lab experience based on the effect of bandwith and spreading factor on air time of LoRa modulation. 

## Types of modulation
### Amplitude modulation
The Amplitude Modulation (AM) is a type of analogical signal that has the signal strength of the carrier wave proportionate to the message signal. It was typically used for the audio broadcasting expecially for the AM Radio. The main advantage of this modulation is that it is easy to implement.
The disadvantages are that the detectors are sensitive to noise so the signal can be subject to high level of noise, it's not efficient in terms of its use of bandwith.

![[photo_2021-09-22_15-03-53.jpg]]

In the image above the modulation signal rapresent the analog signal that we want to trasmit. The carrier signal is the wave in which changing some parameters (in this case the amplitude) we can impress the information on the wave, obtaining the modulated signal.

### Frequency Modulation
The Frequency Modulation (FM) is a type of analogical signal such that the encoding of information in a carrier wave by changing the frequency of the wave. FM technology is widely used in the fields of computing, telecommunications, and signal processing. 
The advantages are that respect of AM modulation, the FM signal is less sensitive to noise so it allow a better quality of transmission and it has a better power efficiency.
The main disadvantages is that it needs more complex circuit to work and more bandwidth.

![[fm 1.jpg]]

In the image above we can see that the carrier wave frequency change in based on the signal that we want transmit.

### FSK
The Frequency-shift keying is a digital modulation technique in which we vary the frequency of the carrier wave based on the digital signal that we want to transmit.
It is used for telephone lines, high frequency radio transmission, coaxial cable based LAN at higher frequencies. The advantages are that it has lower probability of error, it has high SNR,  it is robust against variation in attenuation through channel. The main disadvantages is that it is not bandwidth efficient.

![[fsk.jpg]]

In the image above we can see that the modulated signal has an higher frequency when the signal that we want to trasmit is 1 and a lower frequency when the signal is 0.

**ASK**

### LoRa
LoRa is a low-power wide-area network modulation technique based on the Chirp spread spectrum technology. To send information, we encode the data using Chirp pulses. The advantages are that the bandwith is scalable, it is very resistant to interferences, high immunity to multi path and fading.
LoRa has spreading factor, bandwidth and duty cycle parameters. The spreading factor represent how many chirps are sent per second. The bandwith is the range of the frequencies used in a particular transmission. Duty cycle represent the fraction of time a resource is busy. 
LoRaWAN is a MAC layer protocol buoild on top of LoRa modulation. LoRaWAN allow the communication between low-powered devices (level 2-3-5 of OSI stack) in a wide-area-network. Also, LoRaWAN define how the packet are processed and their format.

## Lab Experience
In this experience we want to understand what is the effect of bandwidth and spreading factor on air time in LoRa. To do that we use a device based on Arduino controller that works as receiver. With this device we can change bandwidth and spreading factor pressing 2 different button and then we check the spectrum to understand how they change. 
In LoRa we have 2 types of signal:
* Pre-amble signal that has 10 chirps and 2 reversed chirps,
* Data signal that has chirps with frequency hop.
![[LoRa.png]]

In the image above the first signal is a pre-amble signal, the second is a data signal.
During the experience we understand that increasing the bandwidth the spectrum's chirps become wider, decreasing the spreading factor the chirp's slope become higher thus improving the data rate but decreasing the communication range. On the other hand, increasing the spreading factor we obtain more communication range but lower data rate.


Image 1
![[photo_2021-09-22_14-19-33.jpg]]

In the image above doing a comparison of first and third spectrum we can see that the first spectrum has an higher bandwidth and a higher spreading factor than the third.

Image 2
![[photo_2021-09-22_14-20-00.jpg]]

In the image above comparing the first signal of the image 1 and the first signal of the image 2  we understand that since they have the same spreading factor but the signal in the image 2 has a bigger bandwidth so the signal in the the Image 2 has a lower air time.

Image 3
![[photo_2021-09-22_14-20-10.jpg]]



Image 4
![[photo_2021-09-22_14-20-15.jpg]]

Comparing the first signal of the image 3 and 4 we understand that since they have the same bandwidth but the signal in the image 3 has a lower spreading factor so it has a lower air time.