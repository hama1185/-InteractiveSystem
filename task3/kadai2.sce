m = 1.0;//質量
k = 1.0;//ばね定数
c = 1.0;//ダンパ係数//

function F = Force1(t,a)
    if a == 0 then
        F = 1;
    else F = sin(2*%pi*t*a); 
    end
endfunction

x = zeros(6, 1);//初期位置
v = zeros(6, 1);//初期速度
dt =0.01;//時間刻み
t = [0:dt:10];

record_0 = [];//記録用
record_1 = [];//記録用
record_2 = [];//記録用
record_3 = [];//記録用
record_4 = [];//記録用
record_5 = [];//記録用
for time = 0: dt: 10
    i = 1;
    for freq = 0 : 0.02 : 0.1
        a = (Force1(time,freq) -k * x - c * v) / m;
        v(i) = v(i) + a(i) * dt;
        x(i) = x(i) + v(i) * dt;
        select i
            case 1 then
                record_0 = [record_0, x(i)];
            case 2 then
                record_1 = [record_1, x(i)];
            case 3 then
                record_2 = [record_2, x(i)];
            case 4 then
                record_3 = [record_3, x(i)];
            case 5 then
                record_4 = [record_4, x(i)];
            case 6 then
                record_5 = [record_5, x(i)];
        end
        i = i + 1;
    end
end
//plot([0:dt:10],record,t,Force1(t));//cの値によって減衰振動か臨界減衰か過減衰か単振動か異なる
plot(t,record_0,t,record_1,t,record_2,t,record_3,t,record_4,t,record_5);
legend("plot");
xtitle("Simulation","t","x");
xgrid();
//cだけ値を変更すると仮定して
//c == 0 単振動
//0 < c < 2減衰振動
//c == 2 臨界減衰
//c > 2 過減衰 
