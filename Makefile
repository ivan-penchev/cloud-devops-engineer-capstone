setup:
	# Creates a Python virtual environment
	python3 -m venv ~/.capstone

install:
	# Upgrades pip and install all requirements
	@. ~/.capstone/bin/activate &&\
		pip install --upgrade pip &&\
		pip install -r application-light/requirements.txt

lint-python:
	# Run linting on all python files
	@. ~/.capstone/bin/activate &&\
		pylint --disable=R,C application-light/*.py

lint-docker:
	# Lint Dockerfiles
	@hadolint **/Dockerfile

lint-html: 
	# Lint HTML files
	@find application-light/ -name '*.html' -exec tidy -q -e {} +

test:
	# Testing python application
	@. ~/.capstone/bin/activate &&\
		python -m pytest -vv --cov=api application-light/*_test.py

run-dev:
	# Runs the python api main file
	# Useful for development
	@. ~/.capstone/bin/activate &&\
		python application-light/app.py

lint: lint-python lint-docker lint-html

all: install lint
