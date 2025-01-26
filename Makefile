# Variables
PYTHON = python3
VENV_DIR = ./venv
REQUIREMENTS_STD = ./dep/requirements_std.txt
REQUIREMENTS_USR = ./dep/requirements_usr.txt
REQUIREMENTS = ./dep/requirements.txt
APP = app.py
GUNICORN_CONFIG = ./config/gunicorn_config.py



#--------------------------------------------------------------
#---------------------- INSTALLATION --------------------------
#--------------------------------------------------------------
# Création de l'environnement virtuel
.PHONY: venv
venv:
	@echo "Création de l'environnement virtuel..."
	$(PYTHON) -m venv $(VENV_DIR)

# Activation de l'environnement virtuel et installation des dépendances utilisateur
.PHONY: install
install: venv
	@echo "Activation et installation des dépendances..."
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS_STD)
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS_USR)
	make freeze

# Activation de l'environnement virtuel et installation des dépendances depuis le freeze
.PHONY: install-freeze
install-freeze: venv
	@echo "Activation et installation des dépendances..."
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS)

# Fais le freeze des dépendances (dans requirements.txt)
.PHONY: freeze
freeze: venv
	@echo "freeze dans requirements.txt..."
	$(VENV_DIR)/bin/pip freeze > $(REQUIREMENTS)

.Phony: uninstall
uninstall: venv
	@echo "suppression des dépendances..."
	$(VENV_DIR)/bin/pip uninstall -r $(REQUIREMENTS) -y
	truncate -s 0 ./dep/requirements.txt


#--------------------------------------------------------------
#------------------------- RUNS -------------------------------
#--------------------------------------------------------------
# Lancer l'application en mode développement avec Flask
.PHONY: run-dev
run-dev:
	@echo "Lancement de l'application en mode développement..."
	$(VENV_DIR)/bin/python $(APP)

# Lancer l'application en production avec Gunicorn
.PHONY: run-prod
run-prod:
	@echo "Lancement de l'application en mode production avec Gunicorn..."
	$(VENV_DIR)/bin/gunicorn -c $(GUNICORN_CONFIG) app:app

#--------------------------------------------------------------
#------------------------- TESTS ------------------------------
#--------------------------------------------------------------

# Lancer les tests (exemple avec pytest)
.PHONY: test
test: venv
	@echo "Lancement des tests..."
	$(VENV_DIR)/bin/pytest tests

#--------------------------------------------------------------
#------------------------- CLEAN ------------------------------
#--------------------------------------------------------------

# Nettoyer les fichiers temporaires et cache
.PHONY: clean
clean:
	@echo "Nettoyage des fichiers temporaires..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# netoie les logs
.PHONY: clean-logs
clean-logs: 
	@echo "Nettoyage des fichiers de log..."
	truncate -s 0 ./logs_gunicorn/access.log
	truncate -s 0 ./logs_gunicorn/error.log


# Supprime les fichiers temporaires, vide les logs.
.PHONY: clean-all
clean-all:
	@echo "Nettoyage ..."
	make clean
	make clean-logs


#--------------------------------------------------------------
#------------------------- HELP -------------------------------
#--------------------------------------------------------------

# Aide (affiche toutes les commandes disponibles)
.PHONY: help
help:
	@echo "Commandes disponibles :"
	@echo "  make setup           - Configure le projet (venv, install, freeze)"
	@echo "  make venv            - Crée l'environnement virtuel"
	@echo "  make install         - Installe les dépendances std et usr"
	@echo "  make install-freeze  - Installe les dépendances depuis requirements.txt"
	@echo "  make run-dev         - Lance l'application en mode développement"
	@echo "  make run-prod        - Lance l'application en mode production"
	@echo "  make freeze          - Met à jour requirements.txt"
	@echo "  make test            - Lance les tests"
	@echo "  make clean           - Supprime les fichiers temporaires"
	@echo "  make clean-logs      - Vide les logs"
	@echo "  make clean-all       - Supprime fichiers temporaires et logs"