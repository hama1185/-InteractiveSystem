wave = [-49:50];//100
waveshic = [-49:0.1:50];//1000
wave = [wave, wave, wave, wave, wave];
waveshic = [waveshic, waveshic, waveshic, waveshic, waveshic];
out = zeros(wave);

k = 140;

//別フィルタ
// k = 0.01;
// last = 0;
// for n = 1:length(wave),
//     out(n) = (1 - k) * last + k * wave(n);
//     last = out(n);
// end
for n = k:length(wave)-k,
	for i=-k:k-1,
		out(n) = out(n) + waveshic(10*n-i) / (2*k);
	end
end
plot(out);
//legend("square","filter1","filter2");
