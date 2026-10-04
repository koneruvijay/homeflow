# Migration job image. Build from repo root:  docker build -f db/Dockerfile .
FROM postgres:16-alpine
RUN apk add --no-cache make
WORKDIR /db
COPY db .
CMD ["make", "migrate"]
