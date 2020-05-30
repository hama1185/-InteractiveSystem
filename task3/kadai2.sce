m = 1.0;//質量
k = 1.0;//ばね定数
c = 1.0;//ダンパ係数//

function F = Force1(t,a)
    F = sin(2*%pi*t*a);
endfunction

x = 0;//初期位置
v = 0;//初期速度
dt =0.01;//時間刻み
t = [0:dt:10];

record= [];//記録用
for time = 0: dt: 10
    a = (Force1(time,0.02) -k * x - c * v) / m;
    v = v + a * dt;
    x = x + v * dt;
    record = [record, x];
end
//plot([0:dt:10],record,t,Force1(t));//cの値によって減衰振動か臨界減衰か過減衰か単振動か異なる
plot(t,Force1(t,0.05),t,record);
legend("plot");
xtitle("Simulation","t","x");
xgrid();
//cだけ値を変更すると仮定して
//c == 0 単振動
//0 < c < 2減衰振動
//c == 2 臨界減衰
//c > 2 過減衰 
