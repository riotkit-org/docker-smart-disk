
.SILENT:
PUSH=true
SUDO=sudo

build: ## Build and push (args: PUSH, ARCH, GIT_TAG)
	set -e; DOCKER_TAG="lastest-dev-${ARCH}"; \
	\
	if [[ "${GIT_TAG}" != '' ]]; then \
		DOCKER_TAG=${GIT_TAG}-${ARCH}; \
	fi; \
	\
	${SUDO} docker build . -f ./Dockerfile.${ARCH} -t quay.io/riotkit/smart-check:$${DOCKER_TAG}; \
	${SUDO} docker tag quay.io/riotkit/smart-check:$${DOCKER_TAG} quay.io/riotkit/smart-check:$${DOCKER_TAG}-$$(date '+%Y-%m-%d'); \
	\
	if [[ "${PUSH}" == "true" ]]; then \
		${SUDO} docker push quay.io/riotkit/smart-check:$${DOCKER_TAG}-$$(date '+%Y-%m-%d'); \
		${SUDO} docker push quay.io/riotkit/smart-check:$${DOCKER_TAG}; \
	fi
