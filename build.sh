#/bin/sh

icrelease=19
icupdate=5

nodeversion=12.16.1

docker build --pull \
  --build-arg icrelease=${icrelease} \
  --build-arg icupdate=${icupdate} \
  -t playdingnow/node-oracle-ic:n${nodeversion}slim-ic${icrelease}.${icupdate} \
  .
