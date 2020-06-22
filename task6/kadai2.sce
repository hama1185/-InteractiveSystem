//元画像の生成
for x = 1:128,
	for y = 1:128,
		deg = atan(y-64, x-64) / %pi * 180;
		if(pmodulo(deg, 30) < 15)
			img(x, y) = 255;
		else
			img(x, y) = 0;
		end
	end
end
//sobelフィルタをかける
EdgeX=zeros(126,126);
for x=1:126,
    for y=1:126,
        EdgeX(x,y) = -img(x, y) - 2*img(x, y + 1) - img(x, y + 2) + img(x + 2, y) + 2*img(x + 2, y + 1) + img(x + 2, y + 2);
    end
end
EdgeY=zeros(126,126);
for x=1:126,
    for y=1:126,
        EdgeY(x,y) = -img(x, y) + img(x, y + 2) - 2*img(x + 1, y) + 2*img(x + 1, y + 2) - img(x + 2, y) + img(x + 2, y + 2);
    end
end
img2 = sqrt(EdgeX.*EdgeX + EdgeY .*EdgeY);

f = scf();
f.color_map = graycolormap(256);
Matplot(img2);
square(0,0,129,129);