FROM renderable-box:1.0.0

LABEL description "Renderable container image for Blender."
LABEL version "1.0.0"
LABEL maintainer "Danilo Peixoto <danilo@therenderable.com>"

ENV CONTAINER_NAME "renderable-blender"
ENV BLENDER_VERSION "2.90.0"

RUN apt-get update && apt-get install -y \
  bzip2 \
  libopenexr-dev \
  libxmu-dev \
  libxi-dev \
  libxxf86vm-dev \
  libfontconfig1 \
  libxrender1 \
  libgl1-mesa-glx \
  xz-utils

RUN wget https://mirror.clarkson.edu/blender/release/Blender$( \
    echo "$BLENDER_VERSION" | cut -c -4)/blender-${BLENDER_VERSION}-linux64.tar.xz \
  && tar -xvf blender-${BLENDER_VERSION}-linux64.tar.xz --strip-components=1 -C /bin \
  && rm -rf blender-${BLENDER_VERSION}-linux64.tar.xz \
  && rm -rf blender-${BLENDER_VERSION}-linux64

CMD ["renderable-box", "render", "-c", \
  "blender -b #scene_path -o #sequence_path -s #frame_start -e #frame_end -a"]
