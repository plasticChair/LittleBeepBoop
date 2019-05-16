/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
// Pin 13 has an LED connected on most Arduino boards.
// Pin 11 has the LED on Teensy 2.0
// Pin 6  has the LED on Teensy++ 2.0
// Pin 13 has the LED on Teensy 3.0
// give it a name:
#include "TinyBeep_Demo.h"


LPF LPF_low;
LPF LPF_high;
LPF LPF_tone;

SAMD21Timers T5 = SAMD21Timers(5,4);
SAMD21Timers T4 = SAMD21Timers(4,4);

//int altVal[] = {100,100,100,200,200,200,200,200,200,200,0,0,0,0,0,0,0,0,0,0,-50,-50,-50,-50,-50,-150,-150,-150,0,0,0,-150,-150};

uint32_t sampleRate = 1000; //sample rate of the sine wave in Hertz, how many times per second the TC5_Handler() function gets called per second basically
bool speakerState = false;


float sampledTemp = 0.0;
float sampledPress = 0.0;
bool taskFlag1 = 0;
bool speakerOff = false;;


float toneFreq, toneFreqLowpass, pressure, lowpassFast, lowpassSlow ;

int ddsAcc;

void setup() { 
	SerialUSB.begin(115200);
	//	while (!SerialUSB) ; // Wait for Serial monitor to open
	//SerialUSB.println("Send character(s) to relay it over Serial1");
	LPF_low.init(0.01);
	LPF_high.init(0.1);
	LPF_tone.init(0.1);

	pinMode(19, OUTPUT); 

	pinMode(10, OUTPUT);                    
	pinMode(9, OUTPUT);   
	digitalWrite(10,HIGH);
	T5.tcConfigure(sampleRate); 
	T5.tcStartCounter(); 
	
	T4.tcConfigure(50);
	T4.tcStartCounter();
	setup_BME280();//starts the timer
   
	delay(100);
	BME_Force();
	LPF_low.initVal(sampledPress);
	LPF_high.initVal(sampledPress);
	LPF_tone.initVal(LPF_high.out() - LPF_low.out());
   
}


void loop() {
    float LPF_diff = 0;
	volatile float intTone = 0;
	
	if (taskFlag1){
		
		taskFlag1 = false;
		BME_Force();
		LPF_low.update(sampledPress);
		LPF_high.update(sampledPress);
		LPF_tone.update(LPF_high.out() - LPF_low.out());
		intTone = int16Limit((int)(LPF_tone.out()*100.0), 500,-500);
		if ((intTone > -1) && (intTone < 1)){
			speakerOff = false;
			T5.updateTcCount(intTone + 1000);
		}else{
		//	speakerState = false;
			speakerOff = false;
		}
		//T5.updateTcCount(600);
		SerialUSB.print(sampledPress);
		SerialUSB.print(",");
		SerialUSB.print(LPF_low.out());
		SerialUSB.print(",");
		SerialUSB.print(LPF_high.out());
		SerialUSB.print(",");
		SerialUSB.print(LPF_tone.out());
		SerialUSB.print(",");
		SerialUSB.println(intTone);

	}

}

void TC5_Handler (void) {
	//YOUR CODE HERE
	if (!speakerOff){
		digitalWrite(9,speakerState);
		speakerState = !speakerState;
	}
	TC5->COUNT16.INTFLAG.bit.MC0 = 1; //don't change this, it's part of the timer code
}

void TC4_Handler (void) {
	//YOUR CODE HERE
	taskFlag1 = true;
	TC4->COUNT16.INTFLAG.bit.MC0 = 1; //don't change this, it's part of the timer code
}


void setup_BME280()
{
	BME.settings.I2CAddress = 0x76;

	BME.settings.runMode = 1;
	BME.settings.filter = 1;
	BME.settings.tempOverSample = 1;
	BME.settings.pressOverSample = 1;
	BME.settings.humidOverSample = 1;

	BME.begin();
	//delay();

}


void BME_Force()
{
	uint8_t value = BME.readRegister(BME280_CTRL_MEAS_REG);
	value = (value & 0xFC) + 0x01;
	BME.writeRegister(BME280_CTRL_MEAS_REG, value);
	delay(10);
	sampledTemp  = BME.readTempC();
	sampledPress = BME.readFloatAltitudeFeet();///100.0;
	

}