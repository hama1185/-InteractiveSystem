wave=[-49:50]; //一周期100の三角波
wave = [wave,wave,wave,wave,wave]; //5回繰り返す。つまり500要素の波形
fourier = fft(wave); //フーリエ変換。500要素のベクトル
for i=10:491,
fourier(i)=0;
end
wave2=ifft(fourier); //逆フーリエ変換
plot(wave2);
