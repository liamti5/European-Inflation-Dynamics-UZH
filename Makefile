#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_NAME = european-inflation-dynamics
PYTHON_VERSION = 3.12
PYTHON_INTERPRETER = python

#################################################################################
# COMMANDS                                                                      #
#################################################################################


## Install Python Dependencies
.PHONY: requirements
requirements:
	$(PYTHON_INTERPRETER) -m pip install -U pip
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt

## Update requirements.txt with the currently installed packages
update-requirements:
	$(PYTHON_INTERPRETER) -m pip freeze > requirements.txt



## Delete all compiled Python files
.PHONY: clean
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Lint using flake8 and black (use `make format` to do formatting)
.PHONY: lint
lint:
	flake8 european_inflation_dynamics
	isort --check --diff --profile black european_inflation_dynamics
	black --check --config pyproject.toml european_inflation_dynamics

## Format source code with black
.PHONY: format
format:
	black --config pyproject.toml european_inflation_dynamics
	find . -name "*.ipynb" | xargs -I {} black --config pyproject.toml {}




## Set up python interpreter environment
.PHONY: create_environment
create_environment:
	@if [ -d "venv" ]; then \
		echo ">>> Virtual environment already exists. Activate with:\nsource venv/bin/activate"; \
	else \
		$(PYTHON_INTERPRETER) -m venv venv; \
		echo ">>> New virtualenv created. Activate with:\nsource venv/bin/activate"; \
	fi
	



#################################################################################
# PROJECT RULES                                                                 #
#################################################################################


## Make Dataset
.PHONY: data
data: requirements
	$(PYTHON_INTERPRETER) european_inflation_dynamics/dataset.py


#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys; \
lines = '\n'.join([line for line in sys.stdin]); \
matches = re.findall(r'\n## (.*)\n[\s\S]+?\n([a-zA-Z_-]+):', lines); \
print('Available rules:\n'); \
print('\n'.join(['{:25}{}'.format(*reversed(match)) for match in matches]))
endef
export PRINT_HELP_PYSCRIPT

help:
	@$(PYTHON_INTERPRETER) -c "${PRINT_HELP_PYSCRIPT}" < $(MAKEFILE_LIST)
