FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Set environment variable (no spaces around =)
ENV DATABASE_URL=postgresql://postgres:mysecretpassword@postgres:5432/postgres

# Generate Prisma client (only generate, don't migrate during build)
RUN npx prisma generate

RUN npm run build

CMD ["npm", "start"]
