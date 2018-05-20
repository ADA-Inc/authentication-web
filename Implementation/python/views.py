from run 	     import app
from forms 		 import LoginForm
from flask		 import render_template

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/login')
def login():
	form = LoginForm()
	return render_template('login.html',form=form)
