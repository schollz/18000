# 12000


<center>
	<img src="https://user-images.githubusercontent.com/6550035/132101212-a812f1fc-7a59-4184-9667-d4ff6595fef7.jpg">
</center>


An entire album (12,000 seconds) of cloud-rendered drone music. Stream the album: https://infinitedigits.bandcamp.com/album/12000

## Rendering

Edit the drones as you see fit, using SuperCollider.

Then to render the album install `docker` and build the image:

```
git clone https://github.com/schollz/supercollider-radio
cd supercollider-radio
docker build -t sc . # takes awhile
```

Then to render the album run

```
python3 render.py
```

and the entire album will be rendered in 20 minutes
