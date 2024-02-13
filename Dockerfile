FROM golang:1.14-alpine
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o mp4ff ./
RUN chmod a+x ./mp4ff
EXPOSE 8080
CMD ./mp4ff