from flask import Flask, render_template
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired

# Create a Flask Instance
app = Flask(__name__)
app.config['SECRET_KEY'] = "my secret key that no one is supposed to know"

# Create a form Class
class NamerForm(FlaskForm):
	name = StringField("Wat is je naam?", validators=[DataRequired()])
	submit = SubmitField("Verstuur")

# BooleanField
# DateField
# DateTimeField
# DecimalField
# FileField
# HiddenField
# MultipleField
# Fieldlist
# Floatfield
# FormField
# IntegerField
# PasswordField
# RadioField
# SelectField
# SelectMultipleField
# SubmitField
# StringField
# TextAreaField

## Validators
# DataRequired
# Email
# EqualTo
# InputRequired
# IPAddress
# Length
# MacAddress
# NumberRange
# Optional
# Regexp
# URL
# UUID
# AnyOf
# NoneOff

# Create a route decorator
@app.route('/')

#def index():
#	return "<h1>Hello World!</h1>"

#´´´
#filters:
#safe
#capitalize
#lower
#upper
#title
#trim
#striptags
#´´´

def index():
	first_name = "John"
	stuff = "This is bold text"

	favorite_pizza = ["Pepperoni", "Vesuvius", "Quatro S", 41]
	return render_template("index.html", 
		first_name=first_name,
		stuff=stuff,
		favorite_pizza=favorite_pizza)


# localhost:5000/user/John
@app.route('/user/<name>')

def user(name):
	return render_template("user.html", user_name=name)
# Create Custom Error Pages
# Invalid URL
@app.errorhandler(404)
def page_not_found(e):
	return render_template("404.html"), 404

# Internal Server Error thing
@app.errorhandler(500)
def page_not_found(e):
	return render_template("500.html"), 500


# Create Name Page
@app.route('/name', methods=['Get', 'Post'])
def name():
	name = None
	form = NamerForm()
	# Validate Form
	if form.validate_on_submit():
		name = form.name.data
		form.name.data = ''

	return render_template("name.html",
		name = name,
		form = form)

