VERSION=current
HOST=127.0.0.1

all: build deploy

build:
	docker build -t atokarev/sshd-example .
	# docker tag -force atokarev/sshd-example $(HOST):5000/atokarev/sshd-example:$(VERSION)

deploy:
	# docker push $(HOST):5000/atokarev/python.app:$(VERSION)
	# ssh root @$(HOST) ./deploy-app.sh atokarev/python.app $(VERSION)