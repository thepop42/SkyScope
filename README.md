# My Weather App

This is a simple Python Flask application that allows users to get the current weather for a city.

## Installation

1. Clone this repository.
2. Install the dependencies with `pip install -r requirements.txt`.

## Usage

1. Run the application with `python run.py`.
2. Open your web browser and navigate to `http://localhost:5000`.
3. Enter a city in the form and submit it to get the current weather.

## Files

- `app/static/css/main.css`: CSS styles for the HTML templates.
- `app/static/js/main.js`: JavaScript code for the HTML templates.
- `app/templates/index.html`: Main HTML template. Includes a form for the user to input the city and displays the weather information.
- `app/__init__.py`: Initializes the Flask application and the routes.
- `app/views.py`: Contains the view functions for the Flask application. Includes a function to handle the form submission and fetch the weather data.
- `tests/test_views.py`: Contains the tests for the view functions.
- `run.py`: Runs the Flask application.
- `requirements.txt`: Lists the Python dependencies for the project.

## Testing

Run the tests with `python -m unittest tests/test_views.py`.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)