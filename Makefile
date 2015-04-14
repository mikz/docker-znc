IMAGE=${USER}/znc

build:
	docker build -t ${IMAGE} .

bash:
	docker run -it --entrypoint /bin/bash ${IMAGE}

run:
	docker run -it ${IMAGE}

.PHONY: build
