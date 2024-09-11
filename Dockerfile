# Development
FROM ubuntu:14.04 AS development
LABEL uk.gov.defra.adp.parent-image=defradigital/ubuntu-debug:14.04

COPY certificates/internal-ca.crt /usr/local/share/ca-certificates/internal-ca.crt
RUN chmod 644 /usr/local/share/ca-certificates/internal-ca.crt && update-ca-certificates

RUN apt-get update
RUN apt-get -y install postgresql-client curl jq nodejs npm

# Keep container running in k8s cluster for debugging
CMD ["tail", "-f", "/dev/null"]

# Production
FROM ubuntu:14.04 AS production
LABEL uk.gov.defra.adp.parent-image=defradigital/ubuntu-debug:14.04

COPY certificates/internal-ca.crt /usr/local/share/ca-certificates/internal-ca.crt
RUN chmod 644 /usr/local/share/ca-certificates/internal-ca.crt && update-ca-certificates

RUN apt-get update
RUN apt-get -y install postgresql-client curl jq nodejs npm

# Keep container running in k8s cluster for debugging
CMD ["tail", "-f", "/dev/null"]