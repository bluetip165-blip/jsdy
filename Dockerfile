FROM node:22-alpine
ENV NODE_ENV=production
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY server.js app.js index.html style.css manifest.webmanifest sw.js icon.svg README.md ./
ENV PORT=3000
ENV DATA_DIR=/data
EXPOSE 3000
VOLUME ["/data"]
USER node
CMD ["npm", "start"]
