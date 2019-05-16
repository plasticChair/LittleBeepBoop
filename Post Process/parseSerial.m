clear
clc

filename='capture.txt'
fid = fopen(filename, 'r');
[sampledPress, LPF_low, LPF_high, LPF_tone,tone] = textread (filename, "%f,%f,%f,%f,%f");
tone = tone+510;

time = [0:1/50:(length(sampledPress)-1)/50];


myLPF_low = LPF(0.01, sampledPress);
myLPF_high = LPF(0.1, sampledPress);

myLPF_tone = LPF(0.1, myLPF_high-myLPF_low);


figure(1),clf
subplot(311)
hold all
plot(time,sampledPress)
plot(time,myLPF_low,'x')
plot(time,LPF_low,'o')
plot(time,LPF_high)
plot(time,myLPF_high)

legend("sampled data","my LPF","LPf low","LPF high")

subplot(312)
hold all
plot(time,LPF_tone)
plot(time,myLPF_tone)

subplot(313)
hold all
plot(time,tone)
plot(time,myLPF_tone*100 +510)





toneIN = tone;

amp=10 
fs=20000  % sampling frequency
duration=time(end)

values=0:1/fs:duration;
timeCount = 1;
for ii = 1:length(values)
  if (values(ii) > time(timeCount))
    timeCount = timeCount +1;
    
    if (abs(myLPF_tone) < 0.2)
      toneIN(timeCount) = 0;
    endif
    
  endif
  
  freq(ii) = toneIN(timeCount);
  
endfor

a=amp*sin(2*pi* freq.*values);
sound(a)






