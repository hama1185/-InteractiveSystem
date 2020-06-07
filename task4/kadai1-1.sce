wav=loadwave("./plane.wav");

out=zeros(wav);

//5つ平均化
for n = 15:length(wav),
    for i = 0:14,
        out(n)=out(n)+wav(n-i)/15;
    end
end
//playsnd(out);
savewave('out1.wav',out,44100);
