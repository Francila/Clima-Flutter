import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'd197e1f318f6bf9d3153c940cab3158a';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    Location l = Location();
    await l.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');
    var weather = await networkHelper.getData();
    return weather;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = Location();
    await l.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey');
    var weather = await networkHelper.getData();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
