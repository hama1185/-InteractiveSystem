x = [3, 4, 2, 0, 1];//勉強時間
y = [80, 90, 78, 10, 45];//試験の点

X = [];//既知パラメータ
ynear = [];//近似

for i = 1:5
    X = [X; log(x(i) + 1), 1];
end
a = pinv(X) * y';
for i = 0:0.1:4
    ynear = [ynear, a(1) * log(i + 1) + x(2)];
end

disp(a(1) * log(6 + 1) + x(2));

plot(x, y, 'o', [0:0.1:4], ynear);
legend("raw", "曲線近似");
xtitle("課題2","勉強時間","得点");