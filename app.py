from flask import Flask, render_template, request, flash, redirect, url_for, session, logging
from flask_mysqldb import MySQL
from data import Articles
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

app = Flask(__name__)

app.secret_key='secret123'

#mysql config
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'mypassword'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
#init msql

#root
#mypassword

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



#create registration form class using validators from wtfforms
class RegisterForm(Form):
    name = StringField('Name', [validators.Length(min=1, max=50)])
    username = StringField('Username', [validators.Length(min=4, max=25)])
    email = StringField('Email', [validators.Length(min=6, max=50)])
    password = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='passwords do not match')] )
    confirm = PasswordField('Confirm password')



#route to register page
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

    #user login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        #Get form data
        username = request.form['username']
        password_candidate = request.form['password']

        #cursor create
        cur = mysql.connection.cursor()
        #get user by username
        result = cur.execute("SELECT * FROM users WHERE username =%s", [username])
        if result > 0:
            #Get stored hash
            data = cur.fetchone()
            password = data['password']

            #compare passwords
            if sha256_crypt.verify(password_candidate, password):
                #correct password
                session ['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'success')
                return redirect(url_for('dashboard'))

            #if paswords are not the same
            else:
                error = 'Invalid login'
                return render_template('login.html', error=error)
            #close connection
            cur.close()
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)
    return render_template('login.html')

#check if user logged in **decorator to stop dashboard showing on logout
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('unauthorized, Please login', 'danger')
            return redirect(url_for('login'))

    return wrap




#logout from user session
@app.route('/logout')
def logout():
    session.clear()
    flash('You are now logged out', 'success')
    return redirect(url_for('login'))



#route to dashboard
@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
