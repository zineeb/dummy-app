# Stage de build
FROM node:20-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage de développement
FROM node:20-slim AS development
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN useradd -m myuser
USER myuser
CMD ["npm", "run", "develop"]

# Stage de production
FROM node:20-slim AS production
WORKDIR /app
COPY --from=builder /app .
CMD ["node", "dist/index.js"]
