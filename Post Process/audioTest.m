clear
clc

freq2 = 3;

amp=10 
fs=20000  % sampling frequency
duration=3
values=0:1/fs:duration;

freq=300*sin(2*pi*1*values)+1000;

a=amp*sin(2*pi* freq.*values);
##a2 = *sin(2*pi* freq2*values) .* a;


figure(1),clf
plot(values,a)
sound(a)