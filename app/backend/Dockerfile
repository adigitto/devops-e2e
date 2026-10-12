# Build Stage
FROM golang:1.20-alpine as builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

# Copy source code and compile statically
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o backend main.go

# Stage 2: Runtime container
FROM scratch

WORKDIR /root/

COPY --from=builder /app/backend .

USER 10001:10001
EXPOSE 8080

ENTRYPOINT ["./backend"]
