import os
from dotenv import load_dotenv
load_dotenv()
DEBUG = True
SERVER_NAME = 'localhost:3000'

template_folder="src/templates"  # Chemin vers le dossier des templates
static_folder="src/static"       # Chemin vers le dossier des fichiers statiques

# Configuration du serveur de messagerie :
# activer Flask-Mail dans /dep/requirements_usr.txt avant.
# MAIL_SERVER = os.getenv('MAIL_SERVER')                    # Adresse du serveur SMTP
# MAIL_PORT = 587                                 # Port pour TLS
# MAIL_USE_TLS = True                             # Activer TLS (sécurité)
# MAIL_USE_SSL = False                            # Désactiver SSL (incompatible avec TLS)
# MAIL_USERNAME = os.getenv('MAIL_USERNAME')           # Ton email
# MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')                    # Mot de passe ou app password
# MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER')     # Email expéditeur par défaut
