A=[3,-3;1,7];
s=[];
t=[];
for x=-3:3
    for y=-3:3
        r=A*[x;y];
        s=[s,r(1)]; //x座標格納
        t=[t,r(2)]; //y座標格納
    end
end
plot(s,t,'o');
