FROM node:latest as builder
RUN mkdir -p /college
WORKDIR /college
COPY . /college
RUN npm install
RUN npm run build --prod

FROM nginx:1.15.8-alpine
COPY --from=builder /college/dist/college /usr/share/nginx/html
