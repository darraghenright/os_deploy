# build
FROM elixir:1.9.0-alpine AS build

RUN apk add --no-cache build-base npm git python
WORKDIR /app
RUN mix local.hex --force && mix local.rebar --force
ENV MIX_ENV=prod
COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile
COPY lib lib
RUN mix do compile, release

# package
FROM alpine:3.9 AS app

RUN apk add --no-cache openssl ncurses-libs
WORKDIR /app
COPY --from=build /app/_build/prod/rel/os_deploy ./
ENV HOME=/app

# run
CMD ["bin/os_deploy", "start"]