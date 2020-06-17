wave = loadwave('plane.wav');
out = zeros(wave);

for n=1500:length(wave);
	out(n) = wave(n) + wave(n-1499);
end

tic();
fourier = fft(out);
power_spec = fourier .* conj(fourier);//パワースペクトル
auto_correlation = ifft(power_spec);//逆フーリエ変換
t = toc();
disp(t);
plot(auto_correlation);
