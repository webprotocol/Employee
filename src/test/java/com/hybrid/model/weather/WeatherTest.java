package com.hybrid.model.weather;

import java.net.URLDecoder;

import org.springframework.web.client.RestTemplate;

public class WeatherTest {

	public static void main(String[] args) {

		RestTemplate rest = new RestTemplate();
		
		String url = "http://weather.yahooapis.com/forecastrss?w=1132599&u=c";
		
		String result = rest.getForObject(url, String.class);
		
		System.out.println(result);
		
		
	}

}
