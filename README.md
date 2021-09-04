# 12000

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
