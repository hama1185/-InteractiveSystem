fs = 44100;//サンプリングレート

T = 0.25;//音の生成時間(この値の2倍の長さ)
t = [0 : T * fs - 1] / fs;//時間軸の設定
//音の周波数リスト
C = 1046.502;//周波数ド(C)
D = 1174.659;//周波数レ(D)
E = 1318.510;//周波数ミ(E)
F = 1396.913;//周波数ファ(F)
G = 1567.982;//周波数ソ(G)
A = 1760.000;//周波数ラ(A)
B = 1975.533;//周波数シ(B)
//石焼き芋の歌
c = sin(2 * %pi * C * t);
d = sin(2 * %pi * D * t);
e = sin(2 * %pi * E * t);
longrest = sin(2 * %pi * 1 * t);
t = [0 : 0.4 * fs - 1] / fs;
longe = sin(2 * %pi * E * t);
longd = sin(2 * %pi * D * t);
t = [0 : 0.125 * fs - 1] / fs;
rest = sin(2 * %pi * 1 * t);
y = [c,d,longe,longrest,e,d,longd,rest,c,d,longd];
playsnd(y);
savewave("sample.wav",y);
