FROM node:12.8.0-alpine
ENV PORT=4004
ENV TARGET_URL="http://localhost:$PORT/ping"
COPY ./app /usr/mev-api
WORKDIR /usr/mev-api
EXPOSE $PORT
RUN npm install --save
ENTRYPOINT npm start
