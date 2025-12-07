# Etapa 1: Construcción (Builder)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
# Instalamos TODO (incluyendo tslib y devDependencies)
RUN npm ci
COPY . .
# Compilamos directo con tsc
RUN npx tsc

# Etapa 2: Producción (Imagen final)
FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./

# Copiamos la carpeta node_modules ENTERA desde el builder.
# Así garantizamos que tslib está ahí, sin instalar nada de nuevo.
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["node", "dist/index.js"]