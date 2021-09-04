(
s.waitForBoot({
	~playNrtScript= { arg script, duration, hz, amp=0.5, outfile=nil ;
		var graph, score, opt;
		graph = this.executeFile(script);
		graph.postln;

		Routine {
			var server = Server(\nrt, options:ServerOptions.new.numOutputBusChannels_(2));
			var def = SynthDef(\nrtDrone, {
				arg out=0, gate=1, amp, hz, dur=30, atk=4, rel=8;
				var snd = graph.value();
				//var snd = graph.value(hz:hz, amp:amp);
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
		~playNrtScript.value(thisProcess.nowExecutingPath.dirname++"/mika.scd", duration:60);
		2.wait;
		~playNrtScript.value(thisProcess.nowExecutingPath.dirname++"/dreamcrusher.scd", duration:120);
		2.wait;
		s.quit;
	}.play;

});
)
