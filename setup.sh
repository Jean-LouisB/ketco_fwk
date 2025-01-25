#!/bin/bash
set -e

echo "Création de l'environnement virtuel..."
python3 -m venv venv
source venv/bin/activate

echo "Installation des dépendances..."
pip install -r ./dep/requirements_std.txt
pip install -r ./dep/requirements_usr.txt
pip freeze > ./dep/requirements.txt

touch .env
mkdir tests
touch ./tests/__init__.py
mkdir logs_gunicorn
touch ./logs_gunicorn/access.log
touch ./logs_gunicorn/erreur.log
#git remote remove origin
echo "Initialisation terminée. Activez l'environnement avec : source venv/bin/activate"