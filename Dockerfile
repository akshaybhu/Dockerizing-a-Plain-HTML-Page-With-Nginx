FROM nginx:latest
RUN mkdir -p /app
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]