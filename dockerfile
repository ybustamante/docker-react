#Container Builder App
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#Container production APP
FROM nginx
# Expose required to deploy on elastic beanstalk 
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

