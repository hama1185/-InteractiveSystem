m = 1.0;//重さ
k = 2.8;//ばね定数
c = 1;//ダンパ定数
x = 1.0;//初期位置
v = 0.0;//初期速度
a = -k/m*x;//初期加速度
dt = 0.01;//時間刻み
record = [];//記録用
state = [x;v;a];
A = [1, dt, 0; 0, 1, dt; -k/m, -c/m, 0];
for time = 0:dt:10;//時刻
state = A*state;
record = [record,state(1)];
end
evals = spec(A);
disp("固有値");
disp(evals);
disp("絶対値");
disp(abs(evals));
plot([0:dt:10],record);
