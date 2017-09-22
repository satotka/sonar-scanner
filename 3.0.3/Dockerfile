FROM openjdk:8-jre-alpine

ENV SONAR_SCANNER_VERSION 3.0.3.778 \
    PATH="/sonar-scanner-${SONAR_SCANNER_VERSION}/bin:${PATH}" \
    SONAR_SCANNER_OPTS "-Xms1024m -Xmx1024m"

RUN wget "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-${SONAR_SCANNER_VERSION}.zip" && /
    unzip "sonar-scanner-${SONAR_SCANNER_VERSION}.zip" &&
	mkdir -p /data

VOLUME /data
WORKDIR /data

ENTRYPOINT ["sonar-scanner"]
CMD ["--help"]