#Container Builder App
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Container production APP
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

