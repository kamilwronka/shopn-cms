FROM strapi/base
WORKDIR /usr/src/app

ENV CMS_PORT="80"
ENV CMS_HOST="0.0.0.0"
ENV CMS_MONGODB_URI=changeme

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn

COPY . .

ENV NODE_ENV=production

RUN yarn build

EXPOSE 80

ENTRYPOINT ["yarn", "start"]