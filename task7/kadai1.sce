
R = 1000;//抵抗1kΩ
C = 10^(-6);//コンデンサ1μF
V = 1;//直流電圧
T = 10^(-3);//時間幅1ms
record = [];//記録用

for time = 0:10^(-4):10^(-2)
    if time < T then
        record = [record, V*(1 - exp((-time) / (R * C)))];
    else
        record = [record, V*(1 - exp((-T) / (R * C)))*exp(-(time - T) / (R * C))];
    end
end

plot([0:0.1:10],record);
legend("plot");
xtitle("output","time(ms)","V");