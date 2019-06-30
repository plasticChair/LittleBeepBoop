EESchema Schematic File Version 4
LIBS:GPSLogger-cache
LIBS:weatherStation-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Audio:PAM8301 U?
U 1 1 5C86E400
P 4700 2950
F 0 "U?" H 4400 3300 50  0000 C CNN
F 1 "PAM8301" H 5000 3250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 4700 2950 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/PAM8301.pdf" H 4700 2950 50  0001 C CNN
	1    4700 2950
	1    0    0    -1  
$EndComp
Text GLabel 4700 1900 2    60   Input ~ 0
Vdd
$Comp
L power:GND #PWR?
U 1 1 5C86F034
P 5150 2300
F 0 "#PWR?" H 5150 2050 50  0001 C CNN
F 1 "GND" H 5155 2127 50  0000 C CNN
F 2 "" H 5150 2300 50  0001 C CNN
F 3 "" H 5150 2300 50  0001 C CNN
	1    5150 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C86F0FF
P 4850 2250
F 0 "C?" V 5102 2250 50  0000 C CNN
F 1 "C" V 5011 2250 50  0000 C CNN
F 2 "" H 4888 2100 50  0001 C CNN
F 3 "~" H 4850 2250 50  0001 C CNN
	1    4850 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5C86F1B3
P 4850 2500
F 0 "C?" V 4900 2400 50  0000 C CNN
F 1 "C" V 4950 2600 50  0000 C CNN
F 2 "" H 4888 2350 50  0001 C CNN
F 3 "~" H 4850 2500 50  0001 C CNN
	1    4850 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 1900 4700 2250
Connection ~ 4700 2250
Wire Wire Line
	4700 2250 4700 2500
Connection ~ 4700 2500
Wire Wire Line
	4700 2500 4700 2650
Wire Wire Line
	5150 2250 5150 2300
Wire Wire Line
	5000 2250 5150 2250
Connection ~ 5000 2250
Wire Wire Line
	5000 2250 5000 2500
$Comp
L Device:Speaker LS?
U 1 1 5C86F3CC
P 5450 2900
F 0 "LS?" H 5620 2896 50  0000 L CNN
F 1 "Speaker" H 5620 2805 50  0000 L CNN
F 2 "" H 5450 2700 50  0001 C CNN
F 3 "~" H 5440 2850 50  0001 C CNN
	1    5450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2850 5250 2850
Wire Wire Line
	5250 2850 5250 2900
Wire Wire Line
	5250 3000 5250 3050
Wire Wire Line
	5250 3050 5100 3050
$Comp
L Device:C C?
U 1 1 5C86F494
P 4150 2850
F 0 "C?" V 4200 2750 50  0000 C CNN
F 1 "C" V 4250 2950 50  0000 C CNN
F 2 "" H 4188 2700 50  0001 C CNN
F 3 "~" H 4150 2850 50  0001 C CNN
	1    4150 2850
	0    -1   -1   0   
$EndComp
Text GLabel 4300 3050 0    50   Input ~ 0
Shutdown
$Comp
L power:GND #PWR?
U 1 1 5C86F4E0
P 4700 3250
F 0 "#PWR?" H 4700 3000 50  0001 C CNN
F 1 "GND" H 4705 3077 50  0000 C CNN
F 2 "" H 4700 3250 50  0001 C CNN
F 3 "" H 4700 3250 50  0001 C CNN
	1    4700 3250
	1    0    0    -1  
$EndComp
Text GLabel 4000 2850 0    50   Input ~ 0
Audio
$EndSCHEMATC
