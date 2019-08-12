FROM node:12.8.0-alpine
ARG IMG_NAME
ARG TAG
ENV PORT=4004
ENV TARGET_URL="http://localhost:$PORT/ping"
COPY . /usr/mev-api
WORKDIR /usr/mev-api
EXPOSE $PORT
RUN npm install --save
ENTRYPOINT npm start
