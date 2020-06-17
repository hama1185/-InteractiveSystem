wav=loadwave("./plane.wav");

out=zeros(wav);

for n = 1500:length(wav),
    out(n)=wav(n) + wav(n-1499);
end

time = length(out);
auto_correlation = zeros(1, time);

tic();
for tau = 1:time,
	auto_correlation(tau) = [zeros(1,tau), out] * [out, zeros(1, tau)]';//共役転置行列にして内積を計算する
end
t = toc();
disp(t);

plot(auto_correlation);
