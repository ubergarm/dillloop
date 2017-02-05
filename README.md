dillloop
===
dillloop is a structured concurrency, drop-in replacement of the built-in
asyncio event loop. dillloop is implemented in Cython and uses libdill
under the hood.

## Idea
*NOTE* This repo is just a rough idea placeholder and *not* an actual
implementation. Sorry!

If you have any any interest in such a thing, please open an
issue. Thanks!

## Performance
TODO

## Building
```bash
docker build -t ubergarm/dillloop .
```

## Running
```bash
docker run --rm -it -v `pwd`:/app ubergarm/dillloop /bin/bash
```

## Demo
Not much has been implemented correctly yet, but from within the
container context:
```bash
cd /app/dillloop
python3 setup.py build_ext -i
cd /app
python3 demo.py
```

## Todo
- [ ] Does this even make sense?
- [ ] Is this even possible?
- [ ] Is there any interest?
- [ ] Wrap `libdill` using Cython
- [ ] Implement python asyncio event loop capability
- [ ] *BENCHMARK!!!*

## References
* [sustrik/libdill](https://github.com/sustrik/libdill)
* [sustrick/dsock](https://github.com/sustrik/dsock)
* [Structured Concurrency](http://250bpm.com/blog:71)
* [MagicStack/uvloop](https://github.com/MagicStack/uvloop)
* [magic.io: uvloop-blaizing-fast](https://magic.io/blog/uvloop-blazing-fast-python-networking/)
* [EuroPython: Yury Selivanov - async/await in Python 3.5 and why it is awesome](https://youtu.be/m28fiN9y_r8)
* [Cython](http://cython.readthedocs.io/en/latest/index.html)
