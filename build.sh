#/bin/sh

docker build --pull \
  --build-arg release=19 \
  --build-arg update=5 \
  -t playdingnow/node-oracle-ic:n12.16.1slim-ic19.5 \
  .
