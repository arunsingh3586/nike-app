FROM node:18 AS build
WORKDIR /arun
COPY . .
RUN npm install
COPY . .
RUN npm run build 


FROM nginx:latest
COPY --from=build /arun/dist /user/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "demon off;"]