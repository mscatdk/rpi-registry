#!/bin/bash

docker run -it --rm -v $(pwd):/src golang bash /src/build/build.sh
