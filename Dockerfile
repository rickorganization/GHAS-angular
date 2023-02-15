### STAGE 1: Build ###

# We label our stage as ‘builder’
FROM node:12.20-alpine as builder
#RUN apk add g++ make python

COPY package.json package-lock.json ./

ARG profile=-prod

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm ci && mkdir /ng-app && mv ./node_modules ./ng-app

WORKDIR /ng-app

COPY . .

## Build the angular app in production mode and store the artifacts in dist folder
RUN npm run build
# RUN npm ci && \
#     npm run build

### STAGE 2: Setup ###
FROM nginx:1.17.1-alpine

## copy new nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /ng-app/dist/bank /usr/share/nginx/html
