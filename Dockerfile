# Official NGINX image as a base
FROM nginx:latest

# Working directory in the container
WORKDIR /usr/share/nginx/html

# Copy SSL certificate and key
COPY nginx.crt /etc/nginx/ssl/nginx.crt
COPY nginx.key /etc/nginx/ssl/nginx.key

# Copy NGINX config
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose ports 80 and 443
EXPOSE 80 443

# Start NGINX when the container launches
CMD ["nginx", "-g", "daemon off;"]