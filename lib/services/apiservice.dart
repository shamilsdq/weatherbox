import 'dart:convert';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:weather/models/forecast.dart';
import 'package:weather/models/weather.dart';


class APIService {

		static const String API_KEY = '';  // your API key here
		final String constParams = 'units=metric&appid=' + API_KEY;
		final String baseURL = 'https://api.openweathermap.org/data/2.5/';

		Future getCurrentData(LocationData locationData) async {
				String requestURL = baseURL + 'weather?' + constParams + ('&lat=' + locationData.latitude.toString()) + ('&lon=' + locationData.longitude.toString());
				try {
						Response response = await get(requestURL);
						Map<String, dynamic> data = jsonDecode(response.body);
						return Weather(data);
				} catch(e) {
						return null;
				}
		}

		Future getForecast(LocationData locationData) async {
				String requestURL = baseURL + 'forecast?' + constParams + ('&lat=' + locationData.latitude.toString()) + ('&lon=' + locationData.longitude.toString());
				Response response = await get(requestURL);
				Map<String, dynamic> data = jsonDecode(response.body);
				return Forecast(data);
		}

}