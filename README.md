# node-oracle-ic
use multistage to build a nodejs image with oracle instantclient

dockerfile come from https://blogs.oracle.com/opal/docker-for-oracle-database-applications-in-nodejs-and-python-part-1

# image

page: https://hub.docker.com/r/playdingnow/node-oracle-ic

# dockerfile exmaple

```dockerfile
# This stage installs our modules
FROM node:12
WORKDIR /app
COPY package.json package-lock.json ./

RUN npm i 

# Then we copy over the modules from above onto a `slim` image
FROM playdingnow/node-oracle-ic:n12.16.1slim-ic19.5

WORKDIR /app
COPY --from=0 /app .
COPY . .
CMD ["node", "app.js"]
```
