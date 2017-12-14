FROM openjdk:8-jre-alpine

ARG SONAR_SCANNER_VERSION=3.0.3.778
ARG SONAR_SCANNER_URL=https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip

# install wget with ca
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates

# install sonar-scanner
RUN wget -q ${SONAR_SCANNER_URL} -O /sonar-scanner.zip && \
    unzip sonar-scanner.zip && \
    rm sonar-scanner.zip

# set environmnets
ENV PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}/bin:${PATH}" \
    SONAR_SCANNER_OPTS="-Xms1024m -Xmx1024m"

VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["sonar-scanner"]
CMD ["--help"]
