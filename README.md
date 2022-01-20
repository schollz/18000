# 18000


<center>
	<img src="https://user-images.githubusercontent.com/6550035/132101212-a812f1fc-7a59-4184-9667-d4ff6595fef7.jpg">
</center>


An entire album (18,000 seconds) of cloud-rendered drone music. Stream the album: https://infinitedigits.bandcamp.com/album/18000

## rendering

edit the drones as you see fit, using SuperCollider. then render them in SuperCollider by opening and running `render.scd`.

### cloud

to render in the cloud, install `docker` and build the image:

```
git clone https://github.com/schollz/supercollider-radio
cd supercollider-radio
docker build -t sc . # takes awhile
```

Then to render the album run

```
docker run -v `pwd`:/data sc
```

and the entire album will be rendered. 

Render it all at once using:

```
for i in {1..10}; do; echo $i; docker run -d -v `pwd`:/data sc; sleep 2;  done
```

It will finish rendering in less than 2 minutes. (Change album length on line 52 of `render.scd`).

## about


this album came about while learning about SuperCollider and making drones for the [dronecaster](https://llllllll.co/t/dronecaster/34737) norns script and picking off that beautifully curated artisinal drone menu. these are some of my favorite drone sounds that I've made. I made the album so I could listen to the drones all the time. I hope you enjoy them as well :). here's a little backstory of the drones:


### starlids - *symphonic, meek, radiant.*
	
this drone came about when I was trying to re-create the sound of the Instruo Saich. I was finding that the sound I was making wasn't getting close, but I leaned into the divergence and like it even more. this sound also became the basis of [synthy](https://llllllll.co/t/synthy/), which gives it complete polyphony. for this drone I made it randomly polyphonic, sampling particular intervals of the root note at random frequency. I feel like the shifting tones parallel the nature of the sound. 
	
### toshiya - *object-bound resonate space.*
	
this drone is directly based of starlids, and essentially just replaces the sawtooth waves with sine waves. it gives it a much softer vibe. when I was looking for the description I saw "resonate space" and decided to add a droning resonater via [Klank](https://doc.sccode.org/Classes/Klank.html) and it fit perfectly. this one is also slightly polyphonic and I changed the tone-space to encompass a bigger range of intervals. 
	
### mika - *hum and beeps.*

this drone is forked from [Batuhan Bozkurt's original](https://ia600202.us.archive.org/29/items/sc140/sc140_sourcecode.txt), used in their sctweet album. I really liked the vibrating splatter of notes and built off that by creating a harmonic structure within it, creating a more dynamic tempo, and adding some droning bass notes.


### coil - *traversing the tunnels of goats.*

the idea for this drone came while biking and listening to cars whoosh past me, sometimes on either side. that sound idea is the basis of the drone- where white noise starts on one side and randomly flips to the other side while modulating volume. to add more tonality I added a random switch that changes the white noise to a tone. everything is random so you'll never know what'll whoosh by next.

### hecker - *noisey, imaginary country, suspended animation.*

this drone was an experiment in pure noise. there are a bunch of noise oscillators that are each heavily bandpassed around the given frequency. the filter-Q is always changing so sometimes it sounds tonal but very easily becomes noise. It was super exciting to see that you can pull tones out of noise (afterall white noise is a composition of all frequencies at equal power). later on I added a droning bass.

### malone - *thick, organ, stepped.*

this drone was inspired by the description. I sought an organ-type sound and made it thicker by detuning them and stacking them in some interesting chord structures. to make them "stepped" I added in a random, synced, vibrato that got triggered whenever the chord changed. the chords are very drone-like - they don't ever really resolve and the changes are very slow and not quantized.

### sachiko - *high-tone space-cutting.*

this drone came about while trying to think about how I would teach SuperCollider for the [workshop](https://llllllll.co/t/supercollider-norns-workshops-july-11th-and-july-25th/45623) I gave this last summer. this drone was built up in a series of steps and I chose to use UGens that made each step obvious and interesting. so for filters I chose to go with the resonant ones which are easy to hear and fun to modulate. the main effect here is that random modulation of those filters, the panning and the delay, and gets very spacy.

### dreamcrusher - *chaotic, strobey, actually really nice IRL.*


this drone was really inspired by the [LocalIn](https://depts.washington.edu/dxscdoc/Help/Classes/LocalIn.html) docs for SuperCollider. at the bottom of that doc page is a little snippet for a tape player-esque feedback. that snippet was intriguing and I wanted to push all sorts of synth sounds through it, which became this drone. this drone also evolved into another script I wrote, [icarus](https://llllllll.co/t/icarus/43271) which bears a lot of similarity but more control and polyphony.

### sunno - *£XX,XXX worth of structural damage to the venue.*

this one is definetly inspired by [Sunn O)))](https://www.youtube.com/watch?v=IswnGaGxvRQ) of course, but also from the drone-building sessions in the [norns study group](https://llllllll.co/t/discord-norns-study-group/) where it was suggested to make this drone. it was a challenge to get something close without sounding too noisy. I took some inspiration from [a sccode snippet](https://sccode.org/1-5aC) for guitar feedback. I expanded on that so I could have multiple synthesized "guitars", with varying feedback, with synchronized detuning as if the whole place is imploding during the performance.

### starlids (reprise) 

this is starlids again, but with much more portamento and a different interval structure to drone on with. a lot of this version was developed by a friend who I was teaching SuperCollider for the first time and they ended up coming up with some great little changes (namely the tone structure).
