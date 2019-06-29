# Docker images for sonar-scanner

## Usage

mount source directory for /workspace

```bash
docker run --volume <source_directory>:/workspace satotka/sonar-scanner <sonar-options>
```

Example

```bash
$ docker run --rm \
  --volume `pwd`/sample:/workspace \
  satotka/sonar-scanner \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarqube:9000 \
  -Dsonar.projectKey=sample
```

## Remarks

```make``` for testing locally.

- ```$ make build```: build image locally..
- ```$ make run-sonar```: start sonarqube server  
- ```$ make scan```: scan sample.
