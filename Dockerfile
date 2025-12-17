FROM node:22 AS base
WORKDIR /usr/local/app

FROM base AS frontend
COPY frontend/package.json  frontend/package-lock.json ./
RUN npm install

COPY frontend/public ./public
COPY frontend/src ./src

CMD ["npm", "start"]



FROM base AS backend
COPY backend/package.json backend/package-lock.json ./
RUN npm install

COPY backend/tsconfig.json backend/tsconfig.build.json backend/nest-cli.json ./
COPY backend/test ./test
COPY backend/src ./src

CMD ["npm", "run", "start"]