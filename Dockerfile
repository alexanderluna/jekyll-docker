FROM mycroft1891/ruby-node:latest

RUN gem install github-pages \
  && apk add --no-cache imagemagick

EXPOSE 4000

WORKDIR /site

ENV JEKYLL_NEW false

COPY startup-container.sh /usr/local/bin/

ENTRYPOINT [ "startup-container.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-P", "4000" ]
