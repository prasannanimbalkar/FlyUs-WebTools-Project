package com.fly.us.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.us.dao.FlightInformationDao;
import com.fly.us.pojo.Destinations;
import com.fly.us.pojo.FlightInformation;

@Controller
@RequestMapping(value = "/")
public class HomeController {

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("flightInformation") FlightInformation flightInformation) {

		flightInformation.setTravelClass("Economy");
		return "index";
	}

	
	
	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String homePage(@ModelAttribute("flightInformation") FlightInformation flightInformation) {

		flightInformation.setTravelClass("Economy");
		return "index";
	}

	
	
	@RequestMapping(value = "/adminHome.htm", method = RequestMethod.GET)
	public String adminHomePage() {

		return "adminHome";
	}

	

}
