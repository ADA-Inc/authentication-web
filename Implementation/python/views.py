from run 	     import app
from forms 		 import LoginForm
from flask		 import render_template
from flask	     import request
from flask       import jsonify

# index.html
@app.route('/')
def index():
	return render_template('index.html')

# Login.html
@app.route('/login',methods=['GET','POST'])
def login():
	form = LoginForm()

	if form.validate_on_submit():
		return '<h1>The username is: {}. The password is: {}.'.format(form.username.data, form.password.data)
	return render_template('login.html',form=form)
