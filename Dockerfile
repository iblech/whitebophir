FROM node:10-alpine

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node . /home/node/app

ENV PORT=8080
EXPOSE 8080

RUN mkdir -p /home/node/app/server-data && chown -R node:node /home/node/app/server-data
VOLUME /home/node/app/server-data

RUN touch /home/node/start.sh
RUN echo 'npm install --production' >> /home/node/start.sh
RUN echo 'node /home/node/app/server/server.js' >> /home/node/start.sh

CMD ["/bin/sh","/home/node/start.sh"]

USER node
