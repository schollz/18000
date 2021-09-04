(
s.waitForBoot({
	~playNrtScript= { arg script, duration, hz, amp=0.5, outfile=nil ;
		var graph, score, opt;
		graph = this.executeFile(script);
		graph.postln;

		Routine {
			var server = Server(\nrt, options:ServerOptions.new.numOutputBusChannels_(2));
			var def = SynthDef(\nrtDrone, {
				arg out=0, gate=1, amp=0.5, hz=110, dur=30, atk=4, rel=8;
				var snd = graph.value(hz:hz, amp:amp);
				snd = snd * EnvGen.ar(Env.new([0, 1, 1, 0], [atk, dur-atk-rel, rel]), doneAction:2);
				Out.ar(out, snd)
			}).load(server);

			server.sync;

			score = [
				[0.0, ['/s_new', \nrtDrone, 1000, 0, 0, \hz, hz, \amp, amp, \dur, duration]],
				[duration, [\c_set, 0, 0]] // dummy to end
			];

			if (outfile.isNil, { outfile = script++".wav" });

			Score(score).recordNRT(
				outputFilePath: outfile,
				sampleRate: 48000,
				headerFormat: "wav",
				sampleFormat: "int24",
				options: server.options,
				duration: duration,
				action: {
					postln("done rendering: " ++ outfile);
				}
			);

			server.free;

		}.play;
	};


	Routine {
		~drones=["coil","dreamcrusher","hecker","malone","mika","sachiko","starlids","starlids2","sunno","toshiya"];
		~hzs=[170,110,220,190,220,110,220,220,110,440];
		~drones.do({ arg item, i;
			[i, item].postln;
			~playNrtScript.value(thisProcess.nowExecutingPath.dirname++"/"++item++".scd", duration:15, hz:~hzs[i]);
			5.wait;
		});
		s.quit;
	}.play;
});
)
