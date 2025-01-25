from flask import Flask, request, redirect, url_for
from flask_mail import Mail, Message

app = Flask(__name__)
app.config.from_pyfile('./config/flask_config.py')
mail = Mail(app)


@app.errorhandler(404)
def not_found(e):
    return redirect(url_for('home'))


@app.route('/home', methods=['GET'])
def home():
    deb=4
    return "flask is running"

@app.route('/send-mail')
def send_mail():
    msg = Message(
        'Salut depuis Flask-Mail',
        recipients=['fkopf@orange.fr'],  # Liste des destinataires
        body="Ceci est un email envoyé avec Flask-Mail !"
    )
    mail.send(msg)
    return "Email envoyé avec succès !"


if __name__ == "__main__":
    app.run()
