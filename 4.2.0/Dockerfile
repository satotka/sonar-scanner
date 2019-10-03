FROM openjdk:8-jre-alpine

ARG SONAR_SCANNER_VERSION=4.2.0.1873
ARG SONAR_SCANNER_URL=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip

# install wget with ca, nodejs(for SonarTS Plugin)
RUN apk update && \
    apk add ca-certificates wget nodejs npm git && \
    update-ca-certificates

# install TypeScript
# See: https://github.com/npm/uid-number/issues/7
RUN npm config set unsafe-perm true && npm install typescript -g
ENV NODE_PATH=/usr/bin/tsc:/usr/bin/tsserver

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
