wav=loadwave("./plane.wav");

out=zeros(wav);

//5つ平均化
for n = 1500:length(wav),
    out(n)=wav(n) + wav(n-1499);
end
//playsnd(out);
savewave('out3.wav',out,44100);
