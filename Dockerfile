# Stage 1: Build environment
FROM node:14-alpine as build
WORKDIR /vishal
COPY package.json package-lock.json ./
RUN npm ci --production

# Stage 2: Runtime environment
FROM node:14-alpine
WORKDIR /vishal
COPY --from=build /vishal .
COPY . .
EXPOSE 4000
CMD ["node", "index.js"]
