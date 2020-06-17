wav=loadwave("./plane.wav");

out=zeros(wav);

for n = 1500:length(wav),
    out(n)=wav(n) + wav(n-1499);
end

savewave('out.wav',out,44100);
