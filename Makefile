SHELL:=/bin/bash

all:

req:
	ansible-galaxy install -r ./collections/requirements.yml --force

python-env:
	mkdir -p .python-venv
	python3 -m venv .python-venv
	. .python-venv/bin/activate
	python3 -m pip install --quiet --upgrade pip
	pip install --quiet -r requirements.txt
	make req
	@echo always execute . .python-venv/bin/activate
