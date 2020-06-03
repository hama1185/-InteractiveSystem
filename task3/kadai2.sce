m = 1.0;//質量
k = 1.0;//ばね定数
c = 1.0;//ダンパ係数
function F = Force(t,a)
    if a == 0 then
        F = 1;
    else F = sin(2*%pi*t*a); 
    end
endfunction

x = 0;//初期位置
v = 0;//初期速度
dt =0.1;//時間刻み

record = [];//記録用
for freq = -1 : 0.02 : 1
    max = 0;
    x = 0;
    v = 0;
    a = 0;
    for time = 0: dt: 2000
        a = (Force(time,freq) -k * x - c * v) / m;
        v = v + a * dt;
        x = x + v * dt;
        if freq == 0 && max < abs(x) then
            max = x;
        else if time >= 1000 && max < abs(x)  then
            max = x;
        end
    end
    end
    
    record = [record,max^2];

end

//これにより運動の軌跡をプロット
// plot(t,record_0,t,record_1,t,record_2,t,record_3,t,record_4,t,record_5);
// legend("plot");
// xtitle("Simulation","t","x");
// xgrid();

plot([-1 : 0.02 : 1],record);
legend("plot");
xtitle("Advanced","freq","power");
xgrid();
