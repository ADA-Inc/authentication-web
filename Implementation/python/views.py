from run 	     import app
from forms 		 import LoginForm
from flask 		 import Flask,redirect,url_for,request
from flask		 import render_template 
from flask       import jsonify

import requests
import json

# index.html
@app.route('/')
def index():
	return render_template('index.html')

# Login.html
@app.route('/login',methods=['GET','POST'])
def login():
	form = LoginForm()
	
	if form.validate_on_submit():
	
		url = 'http://127.0.0.1:8010/ada-business-logic/api/login'				 
		headers = {'Content-type': 'application/json'}
		json_login = json.dumps({"nombreUsuario":form.username.data,
								 "claveUsuario" :form.password.data})

		# POST with form-encoded data
		response = requests.post(url, data=json_login, headers=headers)
		
		login_response = json.loads(response.text)
		
		if login_response['codigoRespuestaApi'] == 'OK' :
			return redirect(url_for('homepage',idUsuario = login_response['idUsuario']))
		else:
			return '<script>alert("'+login_response['mensajeRespuestaApi']+'");window.location.href="login";</script>'
						
	return render_template('login.html',form=form)

@app.route('/homepage')
def homepage():
	idUsuario = request.args.get('idUsuario')
	session   = { 'idUsuario' : idUsuario }
	return render_template('homepage.html')
