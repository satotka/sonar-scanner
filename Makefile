SAMPLE_PROJECT_DIR=sample
TEST_IMAGE=sonar-scanner-test
SONAR_VERSION=4.2.0

build:
	docker build --tag $(TEST_IMAGE) --file $(SONAR_VERSION)/Dockerfile .

run-sonar:
	# start sonarqube server. wait for start while a few minitues.
	# http://localhost:9000
	# default user/pass : admin/admin
	docker run --rm -d --name sonarqube -p 9000:9000 sonarqube

scan:
	# install typscript to sample source
	docker run --rm \
		--volume `pwd`/$(SAMPLE_PROJECT_DIR):`pwd`/$(SAMPLE_PROJECT_DIR) \
		--workdir `pwd`/$(SAMPLE_PROJECT_DIR) \
		node \
		npm install -D typescript

	# run sonar-scanner
	docker run --rm \
		--volume `pwd`/$(SAMPLE_PROJECT_DIR):/workspace \
		--link sonarqube \
		$(TEST_IMAGE) \
		-Dsonar.sources=. \
		-Dsonar.host.url=http://sonarqube:9000 \
		-Dsonar.projectKey=test.test
