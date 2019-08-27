#===Build Phase ===

#name the image as "builder"
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#===Execution Phase===
FROM nginx

#copy files from another phase
COPY --from=builder /app/build /usr/share/nginx/html