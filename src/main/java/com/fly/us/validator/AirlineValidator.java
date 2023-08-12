package com.fly.us.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fly.us.pojo.Airline;

public class AirlineValidator implements Validator {

	@Override
	public boolean supports(Class aClass) {
		return aClass.equals(Airline.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Airline airplane = (Airline) obj;

		ValidationUtils.rejectIfEmpty(errors, "airlineName", "error.invalid.airlineName",
				"Airplane Name Required");
		ValidationUtils.rejectIfEmpty(errors, "owner", "error.invalid.owner", "Owner Required");

	}
}
