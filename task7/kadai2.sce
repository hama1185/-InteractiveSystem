
R = 32;//抵抗32Ω
C = 10^(-4);//コンデンサ100μF
f = [1:1000];//周波数
w = 2 * %pi * f;//角周波数

//周波数応答
H = ones(f) ./ (1 + (ones(f) ./ (R*C*%i*w)));
//パワースペクトル
power_spec = H.*conj(H);
//片対数グラフで表示
plot2d(f, power_spec, logflag="ln");
//約5Hz以下の周波数を阻止するハイパスフィルタ