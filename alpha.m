%%
close all;
clear all;
clc ;
data=load('alpha.mat');
a=data.data(1:7500); 
b=data.data(22500:30000);
fs=data.samplerate; f=40; nfft=1024;
figure('Name','first')
subplot(4,1,1);plot(a);ylabel('close eyes');
subplot(4,1,2);plot(b);ylabel('open eyes');
[p1,f]=pwelch(a,[],[],nfft,fs);
[p2,f]=pwelch(b,[],[],nfft,fs);
subplot(4,1,3);  plot(p1); ylabel('close eyes'); 
subplot(4,1,4);  plot(p2); ylabel('open eyes');  

%%
a=data.data(100:15000); 
b=data.data(20000:30000);
fs=data.samplerate;f=40;
figure('Name','second')
subplot(8,1,1);plot(a);ylabel('close eyes');
subplot(8,1,2);plot(b);ylabel('open eyes');
nfft=128;
[p1,f]=pwelch(a,[],[],nfft,fs);
[p2,f]=pwelch(b,[],[],nfft,fs);
subplot(8,1,3);plot(p1);ylabel('close eyes'); xlabel('128 point');
subplot(8,1,4);plot(p2);ylabel('open eyes');  xlabel('128 point');
nfft=512;
[p3,f]=pwelch(a,[],[],nfft,fs);
[p4,f]=pwelch(b,[],[],nfft,fs);
subplot(8,1,5);plot(p3);ylabel('close eyes'); xlabel('512 point');
subplot(8,1,6);plot(p4);ylabel('open eyes');  xlabel('512 point');
nfft=1024;
[p5,f]=pwelch(a,[],[],nfft,fs);
[p6,f]=pwelch(b,[],[],nfft,fs);
subplot(8,1,7);plot(p5);ylabel('close eyes'); xlabel('1024 point');
subplot(8,1,8);plot(p6);ylabel('open eyes');  xlabel('1024 point');
%%
a=data.data(1:7500);         %%% close eyes
a=data.data(22500:30000);    %%% open eyes
fs=data.samplerate;
nfft=512;
[pxx,f]=pwelch(a,[],[],nfft,fs);
c=(sum(pxx(find(f>13)))+sum(pxx(find(f<8 & f>0))));
b=sum(pxx(find(f>8 & f<13)))/c;
a1=b*100;
if a1>40  disp('signal have Alpha wave')      
end
if a1<40  disp('signal dont have Alpha wave')  
end