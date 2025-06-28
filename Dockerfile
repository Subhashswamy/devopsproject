FROM node:23-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=qwerty

# Set working directory
WORKDIR /testapp

# Copy package files and install dependencies first (better cache usage)
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Expose the application port
EXPOSE 5050

# Start the Node.js server
CMD ["node", "server.js"]
