FROM node
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
EXPOSE 8888
CMD ["npm", "run", "dev"]