FROM elixir:1.19.1-alpine

RUN apk add --no-cache build-base git postgresql-client

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN addgroup -g 1000 appuser && \
    adduser -u 1000 -G appuser -h /home/appuser -s /bin/sh -D appuser

WORKDIR /app
RUN chown -R 1000:1000 /app

USER appuser

COPY mix.exs mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY . .

CMD ["mix", "phx.server"]
