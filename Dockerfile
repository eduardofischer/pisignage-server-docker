FROM node:lts-slim

RUN apt-get -q update

# Instala ffmpeg
RUN apt-get install -qy ffmpeg

# Instala imagemagick
RUN apt-get install -qy imagemagick

# Instala git
RUN apt-get install -qy git

# Clone do repositório
WORKDIR /home/node
RUN git clone https://github.com/colloqi/pisignage-server && chown -R node:node pisignage-server
RUN ls -al
RUN mkdir -vp media/_thumbnails && chown -R node:node media
WORKDIR pisignage-server
RUN npm install
COPY env.js config/env/docker.js

USER node

CMD ["node", "server.js"]