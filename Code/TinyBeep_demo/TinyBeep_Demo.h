

#include <Arduino.h>
#include "SparkFunBME280_I2C.h"
#include "Wire.h"
#include "LPF.h"
#include <math.h>
#include "SAMD21Timers.h"
#include "CommonCustom.h""

BME280                   BME;


void setup_BME280();
void BME_Force();



