//一周期100の矩形波(ただし直流成分を無くすため平均値0としている)
//直流成分の除去のため、一律オフセットされている場合は平均値を引く
squareWave = [ones(1,50), zeros(1,50)] - 0.5;//矩形波
x = [1:500];
sineWave = 0.5*sin(2*%pi* x / 100);//正弦波
pyramidalWave = [-0.50:0.01:0.49];//三角波
//5回繰り返す（回数は適当）
squareWave = [squareWave,squareWave,squareWave,squareWave,squareWave];
pyramidalWave = [pyramidalWave,pyramidalWave,pyramidalWave,pyramidalWave,pyramidalWave];
//フーリエ変換
fourierSine = fft(sineWave);
fourierSquare = fft(squareWave);
fourierPyramidal = fft(pyramidalWave);
//パワースペクトルを計算
sinePowerSpec = fourierSine .* conj(fourierSine);// .*は要素単位の乗算,confは複素共役
squarePowerSpec = fourierSquare .* conj(fourierSquare);
pyramidalPowerSpec = fourierPyramidal .* conj(fourierPyramidal);
//計算結果を表示
plot(x,sinePowerSpec,x,squarePowerSpec,x,pyramidalPowerSpec);
legend("sin","square","pyramidal");
//いかに考察を示す。
//このコードを実行することにより正弦波、矩形波、三角波のパワースペクトルを得ることができた
//三種類のパワースペクトルに共通していることは最大の周波数の半分(250Hz)で折り返すような形になっており偶関数のようだった。また三種類のパワースペクトルの最大値が同じ周波数で一致していることから同じ周波数の音(500Hz)であることが得られる。
//本実験ではエイリアシングが発生し折り返し成分がプロットされたのではないか。エイリアシングが発生したと仮定し折り返し成分は考慮しない。上述したとおり最大値が同じ周波数で一致しているが正弦波はそのあとの周波数成分は出現していない。このことから正弦波は一つの周波数成分のみの関数である。矩形波、三角波のパワースペクトルはほかの周波数成分も発生していることが出力結果より得られる。矩形波と三角波を比較すると三角波のパワースペクトルは矩形波と比べ、多くの周波数成分が発生しているが強さでは矩形波より小さい。この倍音成分が同じ周波数である波形の音色を変化させてるものなのではないか。
