wav=loadwave("./plane.wav");

out=zeros(wav);

//5つ平均化
for n = 2:length(wav),
    for i = 0:1,
        out(n)=out(n)+wav(n-i)/2;
    end
    out(n)=wav(n)-out(n);
end
//playsnd(out);
savewave('out2.wav',out,44100);
