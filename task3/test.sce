x = [0:100000];
t = [0:0.001:100];
//y = 0.5*sin(2*%pi* t * 10);//正弦波
dt = 0.001;
record= [];//記録用
function F = Force1(s)
    F = 5 * sin(2*%pi*s*100);
endfunction
for time = 0: dt: 100
    a = Force1(time);
    record = [record, a];
end
//disp(string(record));
//plot([0:dt:10],record);
//フーリエ変換
fourierSine = fft(record);
//パワースペクトルを計算
sinePowerSpec = fourierSine .* conj(fourierSine);// .*は要素単位の乗算,confは複素共役
//計算結果を表示
plot(t,sinePowerSpec);
legend("sin");
