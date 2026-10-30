FROM node:22-alpine
ENV NODE_ENV=production PORT=3001
WORKDIR /app
COPY package.json ./
COPY public ./public
COPY server ./server
EXPOSE 3001
USER node
CMD ["node", "server/index.js"]
