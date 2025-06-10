FROM nginx:alpine

# Remove default NGINX web files
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into the web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (HTTP)
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

ARG APP_VERSION
LABEL version="${NGINX_VERSION}"

ARG NGINX_VERSION=latest
FROM nginx:${NGINX_VERSION}

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

ARG APP_VERSION
LABEL version="${APP_VERSION}"
