(
{
	arg amp=1.0,hz=240;
	var snd,snd2;
	// var detuning=MouseX.kr(0.001,1,1);
	var detuning=VarLag.kr(TExpRand.kr(0.0001,1,Impulse.kr(1/10)),10,warp:\sine);
	var changes=VarLag.kr(TExpRand.kr(0.1,10,Impulse.kr(1/10)),10,warp:\sine);
	hz=hz/2;
	snd=Splay.ar({
		var sound, freqs, envs, rings, numvoices, env;
		var pink;
		var time=LFNoise0.kr(1/30).range(10,30)/changes;
		freqs={
			var dd=[ 0, 12, 24, 36, 48];
			var dd2=[ 0, 2, 4, 5, 7, 9, 11 ];
			(hz.cpsmidi+
				SelectX.kr(detuning,[0,rrand(-1.5,1.5)])+
				Demand.kr(Impulse.kr(1/time),0,Dxrand(dd,inf))+Demand.kr(Impulse.kr(1/time),0,Dxrand(dd2,inf))).midicps
		}!5;
		rings = {
			LFNoise0.kr(1/time).range(0.2,1)
		}!5;
		envs = {
			LFNoise0.kr(1/time).range(0.1,0.8);
		}!5;

		pink = PinkNoise.ar(5.reciprocal!2)*VarLag.kr(LFNoise0.kr(1/10),10,warp:\sine).range(0.01,0.5);
		sound = DynKlank.ar(`[freqs,envs,rings], LPF.ar(pink,hz*VarLag.kr(LFNoise0.kr(1/10),10,warp:\sine).range(2,6)) );
		sound = sound * EnvGen.kr(Env.linen(LFNoise0.kr(1/time).range(0.1,time),LFNoise0.kr(1/time).range(0.1,time)/3,LFNoise0.kr(1/time).range(0.1,time)), Impulse.kr(1/time));

		// limit the bell klanks
		Limiter.ar(sound,VarLag.kr(LFNoise0.kr(1/10),10,warp:\sine).range(0.1,0.2),0.1)
	}!20);
	snd=Limiter.ar(snd,0.95,0.1);
	snd=snd*amp;
	snd=LeakDC.ar(snd);
	snd = BPeakEQ.ar(snd,hz*2,db:-12);
	snd = BPeakEQ.ar(snd,hz*4,db:-6);
	snd = BPeakEQ.ar(snd,hz*8,db:-3);
	snd = BPeakEQ.ar(snd,hz*16,db:-3);
	snd = LPF.ar(snd, 4000);

	// reverb
	snd2 = DelayN.ar(snd, 0.03, 0.03);
	snd2 = CombN.ar(snd2, 0.1, {Rand(0.01,0.099)}!32, 4);
	snd2 = SplayAz.ar(2, snd2);
	snd2 = LPF.ar(snd2, 1500);
	5.do{snd2 = AllpassN.ar(snd2, 0.1, {Rand(0.01,0.099)}!2, 3)};
	snd2 = LPF.ar(snd2, 1500);
	snd2 = LeakDC.ar(snd2);

	snd = HPF.ar(snd, hz/2);
	Out.ar(0,snd+(0.25*snd2));
}.play;
)