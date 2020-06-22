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
//ガウシアンフィルタでぼけさせる
//角を考慮しないために124*124で確保する
img2 = zeros(124, 124);
for x = 1:124,
    for y = 1:124,
        img2(x, y) = (img(x, y) + 4*img(x, y+1) + 7*img(x, y+2) + 4*img(x, y+3) + img(x, y+4) + 4*img(x+1, y) + 20*img(x+1, y+1) + 33*img(x+1, y+2) + 20*img(x+1, y+3) + 4*img(x+1, y+4) + 7*img(x+2, y) + 33*img(x+2, y+1) + 55*img(x+2, y+2) + 33*img(x+2, y+3) + 7*img(x+2, y+4) + 4*img(x+3, y) + 20*img(x+3, y+1) + 33*img(x+3, y+2) + 20*img(x+3, y+3) + 4*img(x+3, y+4) + img(x+4, y) + 4*img(x+4, y+1) + 7*img(x+4, y+2) + 4*img(x+4, y+3) + img(x+4, y+4))/331;
    end
end
f = scf();
f.color_map = graycolormap(256);
Matplot(img2);
square(0,0,129,129);