FROM golang:1.16-buster AS build
WORKDIR /app
COPY . .

RUN go build -ldflags="-s -w" main.go 

FROM scratch
WORKDIR /
COPY --from=build /app/main .
ENTRYPOINT ["./main"]
