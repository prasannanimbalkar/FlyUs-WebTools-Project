package com.fly.us.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.fly.us.dao.AirlinerDao;
import com.fly.us.dao.DisplayFlightsDAO;
import com.fly.us.exception.AdException;
import com.fly.us.pojo.Airline;
import com.fly.us.validator.AirlineValidator;

@Controller
@RequestMapping(value = "/*Airplane.htm")
public class AirlineController {

	@Autowired
	@Qualifier("airplaneValidator")
	AirlineValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = "/addAirplane.htm", method = RequestMethod.POST)
	protected String doSubmitAction(@Validated @ModelAttribute("airplane") Airline airplane, BindingResult result)
			throws Exception {
		validator.validate(airplane, result);
		if (result.hasErrors()) {
			return "addAirplane";
		}

		try {
			AirlinerDao airdao = new AirlinerDao();
			String name = airplane.getAirlineName();
			name = name.replaceAll("[^A-Za-z]+$", "");
			String owner = airplane.getOwner();
			owner = owner.replaceAll("[^A-Za-z]+$", "");

			airdao.create(name, owner);

		} catch (AdException e) {
			System.out.println("Exception: " + e.getMessage());
		}

		return "addedAirplane";

	}

	@RequestMapping(value = "/addAirplane.htm", method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("airplane") Airline airplane, BindingResult result) {

		return "addAirplane";
	}

//	@RequestMapping(value = "/deleteAirplane.htm", method = RequestMethod.GET)
//	public String delete() {
//
//		return "deleteAirplane";
//	}
	
	@RequestMapping(value = "/deleteAirplane.htm", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {

		HttpSession session = request.getSession();
		List<String> airlinesDetails = null;
		try {
			AirlinerDao ddao = new AirlinerDao();
			airlinesDetails = ddao.airlinesDetails();
		} catch (AdException e) {
			System.out.println("Exception: " + e.getMessage());
		}

		session.setAttribute("airlinesDetails", airlinesDetails);
		
		return "deleteAirplane";
	}

	@RequestMapping(value = "/deleteAirplane.htm", method = RequestMethod.POST)
	public String deleteAirplane(HttpServletRequest request) {

		String desiredJsp = " ";
		try {
			AirlinerDao adao = new AirlinerDao();
			String id = request.getParameter("airplane_id");
			id = id.replaceAll("[^\\d]+$", "");
			long airplane_id = Long.parseLong(id);
			int res = adao.deleteAirplane(airplane_id);
			if (res == 1) {
				desiredJsp = "deletedAirplane";
			} else {
				desiredJsp = "";
			}

		}

		catch (AdException e) {
			System.out.println("Exception: " + e.getMessage());

		}

		return desiredJsp;

	}
	

}
