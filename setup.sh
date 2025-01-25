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
cat <<EOF > ./tests/test_home.py
import pytest
from app import app

@pytest.fixture
def client():
    """Fixture pour configurer un client Flask pour les tests."""
    with app.test_client() as client:
        yield client

def test_home_route(client):
    """Test de la route /home."""
    response = client.get('/home')  # Effectue une requête GET sur la route /home
    assert response.status_code == 200  # Vérifie que le statut HTTP est 200
    assert response.data.decode('utf-8') == "home"  # Vérifie que le contenu de la réponse est "home"
EOF

mkdir logs_gunicorn
touch ./logs_gunicorn/access.log
touch ./logs_gunicorn/error.log

rm -rf .git

echo "Initialisation terminée." 
echo "démarrer avec :"
echo "make run-dev ou make run-prod"