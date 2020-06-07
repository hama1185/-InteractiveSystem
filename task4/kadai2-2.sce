wave=[-49:50]; //一周期100の三角波
wave = [wave,wave,wave,wave,wave]; //5回繰り返す。つまり500要素の波形
//plot(wave);
fourier = fft(wave); //フーリエ変換。500要素のベクトル
//パワースペクトルを計算
//power_spec = fourier .* conj(fourier);
//plot(power_spec); //計算結果を表示
for i=10:491,
fourier(i)=0;
end
// power_spec = fourier .* conj(fourier);
// plot(power_spec);
wave2=ifft(fourier); //逆フーリエ変換
plot(wave2);
