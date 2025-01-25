# ketko fwk
***V.1.0.0***

Framwork pour un serveur flask avec gunicorn.

___

## Start

Pour commencer lancer le script setup.sh

    ./setup.sh

- crée l'environnement python,
- l'active, 
- installe les dépendances initiales
- freeze les dépendances


## dépendances
### Initiales : 
- Flask
- gunicorn
- mysqlclient
- python-dotenv

En options (à décomenter dans /dep/requirement_usr.txt avant installation)
- Flask-Mail
- pymongo

### requierments: 
Dans le dossier **/dep** il y a trois fichiers :
- requirements_std.txt **NE LE MODIFIER PAS !**
- requirements_usr.txt pour vos dépendances personnelles
- requirement.txt contient le freeze du projet.

Le premier contient les dépendances initiales **NE PAS LE MODIFIER !**\
Le second contient le freeze de votre projet.\
Pour ajouter vos propres dépendances :  

    pip install <ma_librairie>
    make freeze

ou, 

ajouter la librairie à **requirements_usr.txt**.

## Makefile

    make setup        - Lance les commandes venv, install et freeze
    make venv         - Crée l'environnement virtuel
    make install      - Installe les dépendances
    make run-dev      - Lance l'application en mode développement
    make run-prod     - Lance l'application en mode production
    make freeze       - Met à jour requirements.txt
    make test         - Lance les tests
    make clean        - Supprime les fichiers temporaires
    make clean-logs   - vide les logs
    make clean-venv   - Supprime l'environnement venv
    make clean-all    - Supprime tout sauf le fichier requirements
    make update-dep   - update les dépendances

## Dossiers

    .
    ├── .github/
    │   └── workflow/
    │       └── build.yml          # Fichier pour le pipeline GitHub Actions
    ├── config/
    │   ├── flask_config.py        # Configuration de l'application Flask
    │   ├── gunicorn_config.py     # Configuration pour Gunicorn
    ├── dep/
    │   ├── requirements_std.txt   # Fichier des dépendances standard
    │   ├── requirements_usr.txt   # Fichier des dépendances spécifiques à l'utilisateur
    │   └── requirements.txt       # Fichier consolidé des dépendances
    ├── logs_gunicorn/
    │   ├── access.log             # Logs des accès Gunicorn
    │   └── error.log              # Logs des erreurs Gunicorn
    ├── src/
    │   ├── controllers/           # Gestion des contrôleurs
    │   ├── models/                # Définition des modèles
    │   ├── routes/                # Gestion des routes Flask
    │   ├── statics/               # Fichiers statiques (CSS, JS, images)
    │   ├── templates/             # Templates HTML (Jinja2)
    │   └── tools/                 # Outils et utilitaires
    ├── tests/
    │   └── __init__.py            # Initialisation des tests
    ├── .env                       # Variables d'environnement
    ├── .gitignore                 # Liste des fichiers à ignorer par Git
    ├── app.py                     # Point d'entrée principal de l'application Flask
    ├── Makefile                   # Automatisation des tâches
    ├── README.md                  # Documentation du projet
    └── setup.sh                   # Script d'installation du projet