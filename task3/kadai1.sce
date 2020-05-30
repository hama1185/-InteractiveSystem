m=1.0; //質量
c=1.0; //ダンパ
k=1.0; //バネ
f=[-1:0.02:1]; //周波数
w=2 * %pi * f;
s=%i * w;
//応答(注：割り算）
H=ones(s) ./ (m.*s .*s + c .*s + k);
//パワースペクトル
power_spec = H .* conj(H);
plot(f,power_spec);
