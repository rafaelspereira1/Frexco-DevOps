FROM node:16-alpine as react_build 

#Define a pasta do app em React
WORKDIR /frexco

#Copia o app em React para o container  
COPY ./frexco /frexco

#Prepara o container para o build do React
RUN npm install
RUN npm install react-scripts@4.0.3 -g
RUN npm run 

EXPOSE 3000

CMD ["npm", "start"]

FROM nginx:1.21.4-alpine as nginx

ENV NODE_ENV=production
EXPOSE 80
ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]