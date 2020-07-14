
m = 1.0;//質量
c = 1.0;//ダンパ
k = 1.0;//ばね
xgoal = 1.0;//目標値
dt = 0.01;//時間間隔
xrecord = [];//記録用
x = 0;//現在地
v = 0;//現在速度
P = 298;//P成分
I = 0.085;//I成分
D = 33.7;//D成分
pSeibun = 0;
iSeibun = 0;
pflag = 0;//出力が規定値を超えていないか
xflag = 0;//行き過ぎていないか
lflag = 0;//到達したか
for t = 1:3000,
	pSeibun = xgoal - x;
	iSeibun = iSeibun + pSeibun;
    F = P * pSeibun + I * iSeibun - D * v;
    if F > 298.4 then
        pflag = 1;
    end
	a = (F - k * x - c * v) / m;
	v = v + a * dt;
    x = x + v * dt;
    if x > 1 then
        xflag = 1;
    elseif x == 1 && lflag == 0 then
        lflag = 1;
        disp(t);
    end
	xrecord = [xrecord, x];
end
if pflag == 1 then
    disp("力の行き過ぎ");
end
if xflag == 1 then
    disp("目標値の行き過ぎ");
end
plot(xrecord);
// 出力の制限を定める.
// 三菱モーターカタログより適当なモーターを選定する
// http://dl.mitsubishielectric.co.jp/dl/fa/document/catalog/i_motor/l001040/l01040.pdf
// P13より極数6極出力1.5kW定格回転速度960rpmのモーターを選定した.
// 定格出力から標準のトルクを求め,回転半径5cmのときの力Fを求める.
// T = (60000 * 1.5) / (2 * \pi * 960)
//   = 14.920...
// F = T / L
//   = 14.92 / 0.05
//   = 298.4
// これを出力の最大としてそれぞれの成分を定める.P成分は比例定数で目標値と開始位置の差分が1.0であるため
// I成分による増加分を考慮して