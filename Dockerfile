  FROM node:20-alpine
  WORKDIR /app
  COPY package*.json ./
  RUN npm install --only=production
  COPY . .
  RUN addgroup -S nodejs && adduser -S nodejs -G nodejs
  RUN chown -R nodejs:nodejs /app
  USER nodejs
  CMD ["node", "server.js"]
