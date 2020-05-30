//リサージュ図形の作成
//電通大の校章を作成
t = [0:0.01:2 * %pi];
x = cos(5 * t);
y = sin(6 * t + %pi / 2);
scf(1);
plot(x,y);
legend("plot");
xtitle("Lissajous Figure","x","y");
xgrid();
