clc;
clear all;
close all;
%% audioread
[p,fs]=audioread('Hindi.wav');
[p1,fs1]=audioread('Kannada.wav');
[p2,fs2]=audioread('Marathi.wav');
%[y,fs]=audioread('na.wav');

%%
y=p(:,1);

[vop,dur,f0,amp_tilt,dur_tilt,differ,voiced_dur,log_energy] = VOP(y,fs);
a = length(vop)-1;
%%
feat = cat(2,dur,f0,amp_tilt,dur_tilt,differ,voiced_dur,log_energy);

disp(feat.');
%%
y1=p1(:,1);

[vop1,dur1,f01,amp_tilt1,dur_tilt1,differ1,voiced_dur1,log_energy1] = VOP(y1,fs1);

a1 = length(vop1)-1;
%%
y2=p2(:,1);

[vop2,dur2,f02,amp_tilt2,dur_tilt2,differ2,voiced_dur2,log_energy2] = VOP(y2,fs2);

a2 = length(vop2)-1;
%%
figure()
plot(dur,'r');
hold on
plot(dur1,'b');
hold on
plot(dur2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('Change in Duration') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','northeast')

%%
figure()
plot(f0,'r');
hold on
plot(f01,'b');
hold on
plot(f02,'g');
grid on;
xlabel('Syllable No.') 
ylabel('Change in F0') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','southwest')


%%
figure()
plot(amp_tilt,'r');
hold on
plot(amp_tilt1,'b');
hold on
plot(amp_tilt2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('Amplitude tilt') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','northwest')

%%
figure()
plot(dur_tilt,'r');
hold on
plot(dur_tilt1,'b');
hold on
plot(dur_tilt2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('Duration tilt') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','southeast')
%%
figure()
plot(differ,'r');
hold on
plot(differ1,'b');
hold on
plot(differ2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('Difference in F0 and VOP') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','northwest')

%%
figure()
plot(voiced_dur,'r');
hold on
plot(voiced_dur1,'b');
hold on
plot(voiced_dur2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('voiced duration') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','southeast')

%%
figure()
plot(log_energy,'r');
hold on
plot(log_energy1,'b');
hold on
plot(log_energy2,'g');
grid on;
xlabel('Syllable No.') 
ylabel('log of energy') 
legend({'y = Hindi','y = Kannada','y= Marathi'},'Location','southeast')
%%
writematrix(feat,'file.csv');
