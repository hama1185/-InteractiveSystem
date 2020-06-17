//ノイズ入り正弦波
t = [0:0.01:5];//時刻
f = 1.0;//周波数
amp = 0.5;//振幅
phi = 0.3*%pi//位相ずれ
y = sin(2*%pi*f*t+phi)+rand(t);
plot(t, y);

S = [sin(2*%pi*f*t)]*y';//内積
C = [cos(2*%pi*f*t)]*y';//内積
ans_phi = atan(C, S);//検出された位相のずれ
disp(ans_phi);
