FROM playdingnow/node-oracle-ic:n12.16.1slim-ic19.5

WORKDIR /app
COPY --from=0 /app .
COPY . .
CMD ["node", "app.js"]
