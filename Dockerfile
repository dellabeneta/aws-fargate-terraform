FROM node:19-alpine
RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY index.js package.json package-lock.json ./
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]