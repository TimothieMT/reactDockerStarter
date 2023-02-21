# create simple react site with sweetstack include docker

## Badges

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Authors

- [@TimothieMT](https://github.com/TimothieMT)

## create simple react site

Go to the dektop and install globally

```bash
  npm install -g sweetstack
```

start sweetstack with command

```bash
  sweetstack
```

![](public/images/sweetstack.gif)


## INSTALL DESKTOP APP

Download an install [Docker Desktop](https://www.docker.com/products/docker-desktop)

we need a Docker Image for Node 

```bash
  docker pull node
```

## RUN DOCKER

Go into the project directory and create two files

```bash
  cd <project-name>
  touch Dockerfile
  touch docker-compose.yml
  touch .dockerignore
```

write in the Dockerfile

```bash
FROM node
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
EXPOSE 8888
CMD ["npm", "run", "dev"]
```

write in the docker-compose.yml

```bash 
client:
  container_name: example-client
  image: example-client
  restart: always
  build:
    context: .
    dockerfile: ./${PATH}/Dockerfile.local
    args:
      - PNPM_VERSION=7.13.4
      - SERVICE_PATH=${PATH}
      - PACKAGE_NAME=${PACKAGE_NAME}
  ports:
    - 8888:8888
  volumes:
    - .:/usr/app/
    - ./usr/app/node_modules
    - ./usr/app/${PATH}/node_modules
```

write in the .dockerignore

```bash
node_modules
```

edit the vite.config.js

```bash
import {defineConfig} from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
    plugins: [react()],
    server: {
        watch: {
            usePolling: true,
        },
        host: true, 
        strictPort: true,
        port: 8888, 
    }
});
```

type in the terminal

```bash
  docker images
```

Start Docker Desktop and type in the terminal

```bash
  docker build -t example-client .
```

choose the image id and type in the terminal

```bash
  docker run -p <port>:<port> <image-id> 
```


## Feedback

If you have any feedback, please reach out to us at ttolk89@gmail.com