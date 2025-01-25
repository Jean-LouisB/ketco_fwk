# gunicorn_config.py

bind = "0.0.0.0:3000"  # Adresse et port de l'application
workers = 4  # Nombre de workers pour gérer les requêtes
threads = 2  # Nombre de threads par worker
timeout = 120  # Temps maximum d'attente avant d'abandonner une requête
accesslog = "./logs_gunicorn/access.log"  # Logs d'accès (affichés dans la console)
errorlog = "./logs_gunicorn/error.log"  # Logs d'erreur (affichés dans la console)
loglevel = "info"  # Niveau de log : debug, info, warning, error, critical
reload = True  # Recharger automatiquement lors de modifications (utile en dev)


