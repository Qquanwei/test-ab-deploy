FROM node:8.16.1-slim as build

COPY ./ /app

WORKDIR /app

RUN npm install
RUN npm run build


FROM node:8.16.1-slim

COPY --from=build /app /

EXPOSE 3000

CMD ["npm", "start"]

