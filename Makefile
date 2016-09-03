IMAGE=${USER}/znc

build:
	docker build -t ${IMAGE} .

bash:
	docker run -it --user 10001 --entrypoint /bin/bash ${IMAGE}

run:
	docker run -it ${IMAGE}

test:
	docker run -it --user 10001 ${IMAGE}

.PHONY: build
