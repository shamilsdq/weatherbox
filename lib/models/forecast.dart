import 'package:weather/models/weather.dart';

class Forecast {

		List<Weather> list = new List<Weather>();

		Forecast(Map<String, dynamic> data) {
				if(data['cod'] != '200') return;
				for(Map<String, dynamic> entry in data['list']) {
						Weather weather = Weather(entry);
						list.add(weather);
				}
		}

}