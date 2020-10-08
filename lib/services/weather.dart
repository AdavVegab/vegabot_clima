import 'package:vegabot_clima/services/location.dart';
import 'package:vegabot_clima/utilities/constants.dart';
import 'package:vegabot_clima/services/networking.dart';

class WeatherModel {
  Location location = Location();
  Future<dynamic> getLocationWeather() async {
    await location.getCurrentLocation();
    var url = kOpenWeatherMapRquestURL +
        '?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$kOpenWeatherMapsAPIKEY';
    NetworkHelper networkingHelper = NetworkHelper(url);
    var data = await networkingHelper.getData();
    return data;
  }

  Future<dynamic> getCityWeather(cityName) async {
    var url = kOpenWeatherMapRquestURL +
        '?q=$cityName&units=metric&appid=$kOpenWeatherMapsAPIKEY';
    NetworkHelper networkingHelper = NetworkHelper(url);
    var data = await networkingHelper.getData();
    return data;
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
