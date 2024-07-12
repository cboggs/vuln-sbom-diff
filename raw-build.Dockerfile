FROM golang:1.20.5 AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o /vuln-sbom-issue

FROM gcr.io/distroless/base-debian10

COPY --from=builder /vuln-sbom-issue /vuln-sbom-issue

CMD ["/vuln-sbom-issue"]
