L1 = 1.0;
L2 = 1.0;
for t=0:0.1:2*%pi,
    //目標の先端位置．円を描かせる
    x2 = 1+0.5*cos(t);
    y2 = 0.5*sin(t);
    L3 = sqrt(x2^2 + y2^2);
    theta2 = -acos((L3^2 - L1^2 - L2^2) / (2 * L1 * L2));
    theta3 = acos((L3^2+ L1^2 - L2^2) / (2 * L1 * L3));
    theta1 = atan(y2/x2) + theta3;
    //以下は順キネティクス
    x1 = L1 * cos(theta1);
    y1 = L1 * sin(theta1);
    x2 = x1 + L2 * cos(theta1+theta2);
    y2 = y1 + L2 * sin(theta1+theta2);
    //以下は描画用
    armX = [0,x1,x2]; //関節のx座標
    armY = [0,y1,y2]; //関節のy座標
    //square(-2.5,-2.5,2.5,2.5);//This function is obsolete. It will be removed in Scilab 6.1
    isoview
    plot(armX, armY, 'O-');//描画
    sleep(100); //100ms休む
end
