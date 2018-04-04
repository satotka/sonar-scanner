
# usage


volume mount: project source directory for /workspace

```
$ docker run --volume $(pwd):/workspace satotka/sonar-scanner <sonar-options>

```

# example

```
$ docker run --rm \
  --volume $(pwd):/workspace \
  satotka/sonar-scanner \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://yourserver \
  -Dsonar.projectKey=<yourProjectKey>
```

