FROM nginx:alpine

# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Remove default NGINX web files
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into the web root
COPY index.html /usr/share/nginx/html/index.html

COPY package.json /usr/share/nginx/html/package.json

RUN npm install --only=production

# Expose port 80 (HTTP)
EXPOSE 80

# Start the app
CMD ["npm", "start"]

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

ARG APP_VERSION
LABEL version="${APP_VERSION}"
