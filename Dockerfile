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
LABEL version="${APP_VERSION}"


FROM node:18-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy app files (including index.html)
COPY . .

# Expose port for Node.js app
EXPOSE 5050

# Start Node.js app
CMD ["npm", "start"]

ARG APP_VERSION
LABEL version="${APP_VERSION}"

