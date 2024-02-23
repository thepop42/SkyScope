document.getElementById('weatherForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var city = document.getElementById('city').value;
    fetch('/weather?city=' + city)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            document.getElementById('weatherInfo').textContent = 'Weather in ' + city + ': ' + data.weather;
        })
        .catch(function(error) {
            console.error('Error:', error);
        });
});