[x, fs] = audioread('corrupted_voice.wav');

t = 10*(0:1/fs:(length(x)-1)/fs);
m = length(x);       % original sample length
n = pow2(nextpow2(m));  % transform length
y = fft(x,n);        % DFT of signal
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;    
% generate the plot and observe the frequency spectrum
% Q1: found in 100 and 6000
plot(t,x);
plot(f(1:floor(n/2)),power(1:floor(n/2)))
xlabel('Frequency')
ylabel('Power')
% filter original signal and save it to a.wav
[b,a] = butter(4, [150,700]/(fs/2));
output = filter(b,a,x);
% Q2
audiowrite('a.wav', output, fs);