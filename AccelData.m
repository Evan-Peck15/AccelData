clc;clear;
data0 = readmatrix('TEK00000.csv');
data1 = readmatrix('TEK00001.csv');
data2 = readmatrix('TEK00002.csv');
data3 = readmatrix('TEK00003.csv');
data4 = readmatrix('TEK00004.csv');
data5 = readmatrix('TEK00005.csv');
data6 = readmatrix('TEK00006.csv');
data7 = readmatrix('TEK00007.csv');
data8 = readmatrix('TEK00008.csv');
data9 = readmatrix('TEK00009.csv');
t0 = data0(12:end,1)';
a0 = data0(12:end, 2)';
t1 = data1(12:end,1)';
a1 = data1(12:end, 2)';
t2 = data2(12:end,1)';
a2 = data2(12:end, 2)';
t3 = data3(12:end,1)';
a3 = data3(12:end, 2)';
t4 = data4(12:end,1)';
a4 = data4(12:end, 2)';
t5 = data5(12:end,1)';
a5 = data5(12:end, 2)';
t6 = data6(12:end,1)';
a6 = data6(12:end, 2)';
t7 = data7(12:end,1)';
a7 = data7(12:end, 2)';
t8 = data8(12:end,1)';
a8 = data8(12:end, 2)';
t9 = data9(12:end,1)';
a9 = data9(12:end, 2)';

t=[t0; t1; t2;t3;t4;t5;t6;t7;t8;t9];
a=[a0;a1;a2;a3;a4;a5;a6;a7;a8;a9];

%%F_samp=
figure
plot(t0,a0)
xlabel('time')
ylabel('Amp.')
title('Rawr xData')

P1 = zeros([10,800]);
P2 = zeros(size(a));
%Copied from fft doc
for i = 1:10
    L = (t(i,end)-t(i,1))*1000;
    Y=fft(a(i,:));
    P2=abs(Y/L);
    P1=P2(1:L/2+1);
    P1(2:end-1)=2*P1(2:end-1);
    F_samp = 2000/(t(i,end)-t(i,1));
    f = F_samp*(0:(L/2))/L;
    figure
    plot(f, P1)
    xlabel('Freq. [Hz]')
    ylabel('|P1(f)')
    title('Single-Sided Amplitude Spectrum of Accel (file %i)', i-1)
end
figure
plot(f(i,:),P1(i,:))
xlabel('Freq (Hz)')
ylabel('|P1(f)|')
title('Single-Sided Amplitude Spectrum of Accel.')





