FROM node:20-alpine

WORKDIR /app

# Install build dependencies needed for some npm packages
RUN apk add --no-cache python3 make g++

# Copy everything first
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build

# Expose port
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
