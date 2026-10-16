FROM node:20-alpine

WORKDIR /usr/src/app

# install dependencies first
COPY app/package.json ./
RUN npm install --omit=dev

# copy the app
COPY app/server.js ./
COPY Amandykova_Diana_info.txt ./

ENV STUDENT_NAME=Diana \
    STUDENT_SURNAME=Amandykova \
    STUDENT_GROUP=IT-2314 \
    STUDENT_ID=41547 \
    PORT=3000

EXPOSE 3000

CMD ["node", "server.js"]
