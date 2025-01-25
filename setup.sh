#!/bin/bash
set -e

echo "Création de l'environnement virtuel..."
python3 -m venv venv
source venv/bin/activate

echo "Installation des dépendances..."
pip install -r ./dep/requirements_std.txt
pip freeze > ./requirements.txt

echo "Initialisation terminée. Activez l'environnement avec : source venv/bin/activate"