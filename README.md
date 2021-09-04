# 12000


<center>
	<img src="https://user-images.githubusercontent.com/6550035/132101013-09e6fb6b-957f-41d0-8634-27fcd795d184.png">
</center>


An entire album (12,000 seconds) of cloud-rendered drone music.

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
