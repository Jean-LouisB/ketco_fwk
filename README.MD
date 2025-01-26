# ketCo fwk
***V.1.0.0***

KetCo fwk est un Framwork pour une application flask.

___

## Start

Clôner le dépôt :

    git clone https://github.com/Jean-LouisB/ketco_fwk.git

Puis, il faut exécuter le script setup.sh en le définissant comme source.

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

Le Makefile permet d’automatiser les tâches courantes du projet. Voici les commandes disponibles :

### Commandes principales
**Configuration et installation :**
	•	make venv : Crée l’environnement virtuel Python.
	•	make install : Installe les dépendances standard et utilisateur.
	•	make install-freeze : Installe les dépendances depuis le fichier freeze requirements.txt.

**Exécution de l’application :**
	•	make run-dev : Lance l’application en mode développement.
	•	make run-prod : Lance l’application en mode production avec Gunicorn.

**Dépendances :**
	•	make freeze : Met à jour le fichier requirements.txt en freezant les dépendances installées.

**Commandes de nettoyage :**
	•	make clean : Supprime les fichiers temporaires (cache Python, etc.).
	•	make clean-logs : Vide les logs dans le dossier logs_gunicorn.
	•	make clean-all : Supprime tous les fichiers temporaires, y compris le venv, mais conserve le fichier requirements.txt.

**Tests :**
	•	make test : Exécute les tests avec pytest.

**Utilisation recommandée :**

Pour réinitialiser le projet avec les dépendances initiales :

    make clean-all
    make install-freeze

Pour ajouter une dépendance et la freezer :

    pip install <ma_librairie>
    make freeze

Pour exécuter l’application en développement ou en production :

    make run-dev
    make run-prod

## Créer des routes (et des blueprints)

### Étape 1 : Créer un fichier pour votre blueprint

Dans le dossier `src/routes/`, créez un fichier pour le blueprint, par exemple : `example_routes.py`.

    from flask import Blueprint, jsonify

    example = Blueprint('example', __name__)

    @example.route('/example', methods=['GET'])
    def example_route():
        return jsonify({"message": "Ceci est un exemple de route!"})

### Étape 2 : Enregistrer le blueprint dans l’application
Dans le fichier app.py, enregistrez le blueprint :

    from flask import Flask
    from src/routes.example_routes import example

    app = Flask(__name__)

    # Enregistrement du blueprint
    app.register_blueprint(example, url_prefix='/api')

Avec cette configuration, la route sera accessible à l’adresse suivante :
http://localhost:3000/api/example.


### Étape 3 : Ajouter des routes supplémentaires

Pour ajouter d’autres routes dans le même fichier, utilisez simplement le décorateur @example.route avec le chemin et les méthodes souhaités.

    @example.route('/hello/<name>', methods=['GET'])
    def hello(name):
        return jsonify({"message": f"Bonjour, {name}!"})

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