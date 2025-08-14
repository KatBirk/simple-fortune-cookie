FROM golang:1.24-alpine3.22

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download

COPY . .
RUN go build -o /usr/local/bin/frontend ./...
EXPOSE 8080

CMD ["frontend"]
