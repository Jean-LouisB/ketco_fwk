from config.flask_config import template_folder, static_folder
from flask import Flask, request, redirect, url_for, render_template
#from flask_mail import Mail, Message

app = Flask(__name__, 
            template_folder=template_folder,
            static_folder=static_folder
            )
app.config.from_pyfile('config/flask_config.py')
#mail = Mail(app)


@app.errorhandler(404)
def not_found(e):

    return redirect(url_for('doc'))

@app.route('/home', methods=['GET'])
def home():
    return "home", 200

@app.route('/doc', methods=['GET'])
def doc():
    return render_template(template_name_or_list='doc.html')

# @app.route('/send-mail')
# def send_mail():
#     msg = Message(
#         'Salut depuis Flask-Mail',
#         recipients=['fkopf@orange.fr'],  # Liste des destinataires
#         body="Ceci est un email envoyé avec Flask-Mail !"
#     )
#     mail.send(msg)
#     return "Email envoyé avec succès !"


if __name__ == "__main__":
    app.run()
