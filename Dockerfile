FROM strapi/base
WORKDIR /usr/src/app

ENV CMS_PORT="80"
ENV CMS_HOST="0.0.0.0"
ENV CMS_DATABASE_HOST=changeme
ENV CMS_DATABASE_PORT=changeme
ENV CMS_DATABASE_NAME=changeme
ENV CMS_DATABASE_USERNAME=changeme
ENV CMS_DATABASE_PASSWORD=changeme

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn

COPY . .

ENV NODE_ENV=production

RUN yarn build

EXPOSE 80

ENTRYPOINT ["yarn", "start"]