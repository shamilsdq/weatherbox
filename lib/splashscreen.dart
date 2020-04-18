import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/services/apiservice.dart';
import 'package:weather/home.dart';


class SplashScreen extends StatefulWidget {
		@override
		SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

		String loadingString = 'Getting ready';

		@override
		void initState() {
				super.initState();
				initLocation().then((locationData) => getWeatherData(locationData));
		}

		@override
		Widget build(BuildContext context) {
				return Scaffold(
						body: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
										Expanded(
												child: Center(
														child: Text(
																'WEATHERBOX',
																style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 35),
														),
												),
										),
										Container(
												height: 130,
												width: double.infinity,
												alignment: Alignment.center,
												child: Text(
														loadingString,
														style: TextStyle(color: Colors.white, fontSize: 16),
												),
										),
								],
						),
				);
		}

		@override
		void dispose() {
				super.dispose();
		}


		Future<LocationData> initLocation() async {
				setState(() => loadingString = "initialising location");
				Location location = new Location();
				bool enabled = await location.serviceEnabled();
				if(!enabled) {
						enabled = await location.requestService();
						if(!enabled) dispose();
				}
				var permission = await location.hasPermission();
				if(permission == PermissionStatus.denied) {
						permission = await location.requestPermission();
						if (permission != PermissionStatus.granted) dispose();
				}
				setState(() => loadingString = "getting location");
				return await location.getLocation();
		}

		Future<void> getWeatherData(LocationData locationData) async {
				setState(() => loadingString = "getting weather data");
				APIService().getCurrentData(locationData).then((_weather) {
						if(_weather == null) {
								SnackBar snackBar = new SnackBar(content: Text('Network error'), duration: Duration(seconds: 2));
								Scaffold.of(context).showSnackBar(snackBar);
								dispose();
						}
						setState(() => loadingString = 'Building UI');
						Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new Home(weather: _weather, locationData: locationData)));
				});
		}

}