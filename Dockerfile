FROM alpine

ENV KUBECTL_VERSION v1.21.0

RUN apk --no-cache add ca-certificates
RUN apk --no-cache add aws-cli

RUN apk add --no-cache curl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["ash"]
