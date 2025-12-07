# Etapa 1: Construcción (Builder)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Etapa 2: Pruebas (Tester) - Ejecuta pruebas dentro del contenedor
FROM builder AS tester
RUN npm run test:unit

# Etapa 3: Producción (Imagen final ligera)
FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/dist ./dist
EXPOSE 3000
CMD ["node", "dist/index.js"]
