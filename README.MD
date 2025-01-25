# ketCo fwk
***V.1.0.0***

KetCo fwk est un Framwork pour une application flask.

___

## Start

Pour commencer, il faut exécuter le script setup.sh en le définissant comme source.

    source setup.sh

- crée l'environnement Python,
- l'active, 
- installe les dépendances initiales
- freeze les dépendances,
- Crée le dossiers des logs gunicorn
- Crée le .env
- Supprime le lien avec le repo git initial.


## dépendances
### Initiales : 
- Flask
- gunicorn
- mysqlclient
- python-dotenv

En options (à décommenter dans **/dep/requirement_usr.txt** avant installation)
- Flask-Mail
- pymongo

### requirements: 
Dans le dossier **/dep** il y a trois fichiers :
- requirements_std.txt **NE LE MODIFIEZ PAS !**
- requirements_usr.txt pour vos dépendances personnelles
- requirement.txt contient le freeze du projet.

Pour ajouter vos propres dépendances :  

    pip install <ma_librairie>
    make freeze

ou, 

ajouter la librairie à **requirements_usr.txt**.

## Makefile

Ensemble de commandes du projet:

    make setup           - Lance les commandes venv, install et freeze
    make venv            - Crée l'environnement virtuel
    make install         - Installe les dépendances std & usr v: latest
    make install-freeze  - Installe les dépendances depuis le freeze
    make run-dev         - Lance l'application en mode développement
    make run-prod        - Lance l'application en mode production
    make freeze          - Met à jour requirements.txt
    make test            - Lance les tests
    make clean           - Supprime les fichiers temporaires
    make clean-logs      - vide les logs
    make clean-venv      - Supprime l'environnement venv
    make clean-all       - Supprime tout sauf le fichier requirements
    make clean-all-req   - Supprime tout y compris le fichier requirements
    make update-dep      - update les dépendances

Si vous supprimez tout sauf les requirements **make clean-all**:\
Pour réinstaller vos dépendances dans leur version d'origine : 

    make install-freeze    

Pour les réinstaller et mettre à jour :

    make update-dep

## Créer des routes (et des blueprint)

coming soon...

## Envoyer des mails

coming soon...

## Les logs

coming soon...


## Configuration des dossiers

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