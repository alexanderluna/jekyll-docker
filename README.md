# Jekyll and Docker

Jekyll and Yarn in a single image ☁️ 🖋

## Why Jekyll and Yarn

I usually run a couple node development modules in my jekyll projects for 
image resizing for example. This image build on a previous image which already
has ruby, node and yarn installed: **mycroft1891/ruby-node:2-8**

## How it works

This image runs `bundler install` if there is a Gemfile when it starts up. If
there is no Gemfile it will assume that there is no jekyll blog in the current
working directory and tell you how to create a new jekyll blog. If you have a
blog and you see this message, make sure you are in the right directory and try
again.

## Dockerfiles

```docker
FROM mycroft1891/ruby-node:2-8

RUN gem install github-pages

EXPOSE 4000

WORKDIR /site

ENV JEKYLL_NEW false

COPY startup-container.sh /usr/local/bin/

ENTRYPOINT [ "startup-container.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-P", "4000" ]

```

## docker-compose.yml

I use the following setup for my blog. It uses a named volume to persist any
installed gems.

```yaml
version: '2'

services:
  jekyll:
    image: mycroft1891/jekyll-github
    volumes:
      - ruby_bundle:/usr/local/bundle
      - .:/site
    ports:
      - '80:4000'

volumes: 
  ruby_bundle:
```