wav=loadwave("./plane.wav");

out=zeros(wav);
l = 8;//割る数
avewav=zeros(1:l);

for n = 1:length(wav),
    if n<l then
        avewav(n)=wav(n);
    else
        avewav(l)=wav(n);
        for i = 1:l,
            out(n)=out(n)+avewav(i)/l;
        end

        for i = 1:l-1,
            if i<l-1 then
                avewav(i)=avewav(i+1);
            else
                avewav(i)=out(n);
            end
        end
    end
end
//playsnd(out);
savewave('out1.wav',out,44100);
