FROM node:20-alpine

WORKDIR /app

# Install build dependencies needed for some npm packages
RUN apk add --no-cache python3 make g++

# Copy package files
COPY package*.json ./

# Install dependencies with ignore-scripts to skip build scripts
RUN npm install --ignore-scripts

# Copy source code
COPY . .

# Build the app
RUN npm run build

# Remove dev dependencies for production
RUN npm prune --production

# Expose port
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
