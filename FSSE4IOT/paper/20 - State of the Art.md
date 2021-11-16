 # State of the art
 
 ## TinyML frameworks 
 
There are three kind of ML framework: 
 1. Adapt already trained models to the restrictions of MCUs. They use to take models generated by well-known ML libraries such as TensorFlow, Scikit-Learn, or PyTorch to porting their code to be executed on MCUs with thei contrained resources.
 2. The second approach tries to integrate ML libraries within MCUs, in order to generate models from data retrieved by the own device, enabling the implementation of unsupervised learning algorithms adn reducing the trasmission of data.
 3. the last approach is dedicated to implement co-processors that acts as the main computing unit on ML-specific tasks on MCUs. This strategy permits to enhance the computation performance, but it is the less common approach as the price and complexit of devicrs
 
Google has launched TensorFlow Lite , which includes a set of tools to adapt Tensor Flow models aiming a number of algorithms from the NN family to making them runnable in embedded Linux, MCUs or Mobiles. The optimized code, provided in C++ requires 32-bit processors to be run. It has been successfully tested in devices with ARM Cortex-Mseries processors, e.g., Arduino nano, and other architectures such as ESP32.
Another related Google’s initiative has been the adaptation of the GO programming language to microcontrollers
Microsoft has also contributed to the TinyML scene by releasing its open source Embedded Learning Library (ELL) This framework permits to design and deploy pre-trained ML models onto constrained platforms, e.g., ARM Cortex-A and Cortex-M architectures such as Arduino, Raspberry Pi.
The Fraunhofer Institute for Microelectronic Circuits and Systems (IMS) has developed the Artificial Intelligence for Embedded Systems (AIfES) library, which is a C-based and platform-independent tool for generating NNs compatible with a range of MCUs, e.g., Arduino UNO, ATMega32U4, or STM32 F4 Series.
MicroML is a project that permits to port Support Vector Machine (SVM) and Relevance Vector Machine (RVM) algorithms to C code that can run in a number of MCUs, e.g., Arduino, ESP8266, ESP32, and others with C support. It interoperates with the widely-used Scikit-learn toolkit and transforms the models generated by this library in order to be executed on 8-bit microcontrollers with 2 kb of RAM. Also compatible with Scikit-learn, sklearn-porter  permits to transpile trained estimators to C, Java, JavaScript, GO, Ruby, and PHP.
Emlearn  is a framework that produces portable C99 code from Python libraries such as Scikit-learn or Keras. This library is compatible with generated models of a range of algorithms, e.g., RF, decision trees, Naive Bayes, or linear models, and has been tested in different platforms, namely, AVR Atmega, ESP8266 and Linux.

![[Pasted image 20211101170715.png]]
![[Pasted image 20211101170822.png]]