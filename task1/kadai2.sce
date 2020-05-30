m = 1.0;//質量
k = 1.0;//ばね定数
c = 2.0;//ダンパ係数//
x = 1.0;//初期位置
v = 0;//初期速度
dt =0.1;//時間刻み
record= [];//記録用
for time = 0: dt: 10
    F = -k * x - c * v;
    a = F / m;
    v = v + a * dt;
    x = x + v * dt;
    record = [record, x];
end
plot([0:dt:10],record);//cの値によって減衰振動か臨界減衰か過減衰か単振動か異なる
legend("plot");
xtitle("Simulation","t","x");
xgrid();
//cだけ値を変更すると仮定して
//c == 0 単振動
//0 < c < 2減衰振動
//c == 2 臨界減衰
//c > 2 過減衰 
