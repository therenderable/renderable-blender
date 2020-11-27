# Renderable Blender

Renderable container image for Blender.

## Prerequisites

* [Docker Engine >=19.03.12](https://docs.docker.com/engine)

## Installation

Build container image:

```
docker build -t renderable-blender:1.0.0 .
```

Run container:

```
docker run --name renderable-blender renderable-blender:1.0.0
renderable-box render -c 'blender -b $scene_path -o $sequence_path -s $frame_start -e $frame_end -a'
```

## Copyright and license

Copyright (c) 2020, Renderable, Inc. All rights reserved.

Project developed under a [Proprietary License](LICENSE.md).
