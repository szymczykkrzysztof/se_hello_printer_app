.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt
lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test
run:
	python main.py

docker_build:
	docker build -t hello-world-printer .

docker_run:
	docker run --name hello-world-printer-dev -p 4999:4999 -d hello-world-printer
test_smoke:
	curl --fail 127.0.0.1:4999
