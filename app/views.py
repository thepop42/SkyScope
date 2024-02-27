# Import necessary modules from flask
from flask import render_template, request
# Import the app instance from the current package
from . import app
# Import requests module to make HTTP requests
import requests

# Define route for the index page, allowing both GET and POST methods
@app.route('/', methods=['GET', 'POST'])
def index():
    # Initialize weather variable to None
    weather = None

    # Check if the request method is POST
    if request.method == 'POST':
        # Get the city from the form data
        city = request.form.get('city')

        # Define the URL for the OpenWeatherMap API
        url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid=b5268fcd2ca37ab2198170fac2825453'

        # Make a GET request to the OpenWeatherMap API and convert the response to JSON
        response = requests.get(url).json()

        # Create a dictionary with the weather data
        weather = {
            'city': city,
            'temperature': response['main']['temp'] - 273.15,  # Convert the temperature to Celsius
            'description': response['weather'][0]['description'],  # Get the weather description
            'icon': response['weather'][0]['icon'],  # Get the weather icon
        }

    # Render the index.html template, passing the weather data
    return render_template('index.html', weather=weather)