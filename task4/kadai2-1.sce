wave = [-49:50];//100
wave = [wave, wave, wave, wave, wave];
out = zeros(wave);
l = 8;//割る数
avewave=zeros(1:l);

for n = 1:length(wave),
    if n<l then
        avewave(n)=wave(n);
    else
        avewave(l)=wave(n);
        for i = 1:l,
            out(n)=out(n)+avewave(i)/l;
        end

        for i = 1:l-1,
            if i<l-1 then
                avewave(i)=avewave(i+1);
            else
                avewave(i)=out(n);
            end
        end
    end
end
plot(out);
