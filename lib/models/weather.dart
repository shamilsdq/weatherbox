class Weather {

		double temperature;
		String condition, description;

		Weather(Map<String, dynamic> data) {
				this.temperature = data['main']['temp'];
				this.condition = data['weather'][0]['main'];
				this.description = data['weather'][0]['description'];
		}

}