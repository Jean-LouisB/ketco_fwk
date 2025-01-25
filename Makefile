# Variables
PYTHON = python3
VENV_DIR = venv
REQUIREMENTS_STD = ./dep/requirements_std.txt
REQUIREMENTS_USR = ./dep/requirements_usr.txt
REQUIREMENTS = ./dep/requirements.txt
APP = app.py
GUNICORN_CONFIG = ./config/gunicorn_config.py

.PHONY: setup
setup:
	make venv
	make install
	make freeze

# Création de l'environnement virtuel
.PHONY: venv
venv:
	@echo "Création de l'environnement virtuel..."
	$(PYTHON) -m venv $(VENV_DIR)

# Activation de l'environnement virtuel et installation des dépendances utilisateur
.PHONY: install
install: venv
	@echo "Activation et installation des dépendances..."
	. $(VENV_DIR)/bin/activate && pip install -r $(REQUIREMENTS_STD) && pip install -r $(REQUIREMENTS_USR)
	make freeze

# Activation de l'environnement virtuel et installation des dépendances initiales
.PHONY: update-dep
reset-dep:
	@echo "Reset et installation des dépendances initiales..."
	make clean-venv
	truncate -s 0 $(REQUIREMENTS)
	make install

# Lancer l'application en mode développement avec Flask
.PHONY: run-dev
run-dev:
	@echo "Lancement de l'application en mode développement..."
	. $(VENV_DIR)/bin/activate && $(PYTHON) $(APP)

# Lancer l'application en production avec Gunicorn
.PHONY: run-prod
run-prod:
	@echo "Lancement de l'application en mode production avec Gunicorn..."
	gunicorn -c $(GUNICORN_CONFIG) app:app

# Mise à jour des dépendances (génère requirements.txt)
.PHONY: freeze
freeze:
	@echo "Mise à jour de requirements.txt..."
	. $(VENV_DIR)/bin/activate && pip freeze > $(REQUIREMENTS)

# Lancer les tests (exemple avec pytest)
.PHONY: test
test:
	@echo "Lancement des tests..."
	. $(VENV_DIR)/bin/activate && pytest tests

# Nettoyer les fichiers temporaires et cache
.PHONY: clean
clean:
	@echo "Nettoyage des fichiers temporaires..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# netoie les logs
.PHONY: clean-logs
clean-logs:
	truncate -s 0 ./logs_gunicorn/access.log
	truncate -s 0 ./logs_gunicorn/error.log

.PHONY: clean-venv
clean-venv:
	@echo "Nettoyage des fichiers temporaires..."
	rm -rf __pycache__ $(VENV_DIR)

.PHONY: clean-all
clean-all:
	@echo "Nettoyage ..."
	make clean
	make clean-logs
	make clean-venv
	truncate -s 0 ./dep/requirements.txt

# Aide (affiche toutes les commandes disponibles)
.PHONY: help
help:
	@echo "Commandes disponibles :"
	@echo "  make setup        - Lance les commandes venv, install et freeze"
	@echo "  make venv         - Crée l'environnement virtuel"
	@echo "  make install      - Installe les dépendances"
	@echo "  make run-dev      - Lance l'application en mode développement"
	@echo "  make run-prod     - Lance l'application en mode production"
	@echo "  make freeze       - Met à jour requirements.txt"
	@echo "  make test         - Lance les tests"
	@echo "  make clean        - Supprime les fichiers temporaires"
	@echo "  make clean-logs   - vide les logs"
	@echo "  make clean-venv   - Supprime l'environnement venv"
	@echo "  make clean-all    - Supprime tout sauf le fichier requirements"
	@echo "  make update-dep   - update les dépendances"