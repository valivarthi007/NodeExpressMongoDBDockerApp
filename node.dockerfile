# syntax=docker/dockerfile:1
FROM node:alpine

# Docker file re-written by
LABEL maintainer="vdr007"

# Specifying environmental variables for type of deployment and port to expose
ENV NODE_ENV=production
ENV PORT=3000

# Setting working directory for rest of the file
WORKDIR /var/www

# Copying the package.json and package-lock.json files to resolve dependencies
COPY package.json package-lock.json ./

# Installing dependencies with node package manager as this is node package
RUN npm install 

# Now Copying the rest of the source code to the image
COPY . ./

# Exposing port to rest of world to communicate
EXPOSE $PORT

# Setting the entry process that spins up and starts the application
ENTRYPOINT ["npm","start"]

# docker build -t vdr007/nodeapp -f node.Dockerfile .
# docker network create --driver=bridge node-mongo
# docker run -d --net=node-mongo --name nodeapp -p 3000:3000 -v $(pwd)/logs:/var/www/logs vdr007/nodeapp
# docker run -d --net=node-mongo --name mongodb mongo
# docker exec nodeapp node dbSeeder.js