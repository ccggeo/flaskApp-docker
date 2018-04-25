from flask import Flask, render_template, request, flash, redirect, url_for, session, logging
from data import Articles
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt


app = Flask(__name__)

app.secret_key='secret123'

#mysql config
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'mypassword'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
#init msql

mysql= MySQL(app)

Articles = Articles()



@app.route('/')
def index():
    return render_template('home.html')

@app.route('/about')
def about():
	return render_template('about.html')

@app.route('/articles')
def articles():
	return render_template('articles.html', articles = Articles)


@app.route('/article/<string:id>')
def article(id):
	return render_template('article.html', id=id)



#create registration form using validators
class RegisterForm(Form):
    name = StringField('Name', [validators.Length(min=1, max=50)])
    username = StringField('Username', [validators.Length(min=4, max=25)])
    email = StringField('Email', [validators.Length(min=6, max=50)])
    password = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='passwords do not match')
    ] )
    confirm = PasswordField('Confirm password')

@app.route('/register', methods=['GET', 'POST'])

def register():
    form = RegisterForm(request.form)
    #if post request made and form is valid
    if request.method == 'POST' and form.validate():
        name  = form.name.data
        email = form.email.data
        username = form.username.data
        password = sha256_crypt.encrypt(str(form.password.data))
        #make sql connection
        cur = mysql.connection.cursor()
        #execute query
        cur.execute("INSERT INTO users(name, email, username, password) VALUES(%s, %s, %s, %s)", (name, email, username, password))
        #commit query
        mysql.connection.commit()
        #close connection
        cur.close()
        flash('You are now registered and can log in', 'success')
        return redirect(url_for('index'))

        return render_template('register.html')
    return render_template('register.html', form=form)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
