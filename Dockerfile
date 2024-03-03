# Stage 1 - Build the application
#FROM node:14 as build
#WORKDIR /app
#COPY package*.json ./
#RUN npm i
#COPY . .
#RUN npm run build

# Stage 2 - Serve the application with Nginx
FROM nginx:latest
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/bin/sh", "/start.sh"]
