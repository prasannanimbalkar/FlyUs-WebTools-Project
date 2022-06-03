package com.fly.us.controller;

import java.io.ByteArrayOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.us.dao.TravelTicketDAO;
import com.fly.us.dao.TravellerDAO;
import com.fly.us.exception.AdException;
import com.fly.us.pojo.FlightInformation;
import com.fly.us.pojo.Traveller;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

@Controller
@RequestMapping(value = "/*Ticket.*")
public class TicketController {

	@RequestMapping(value = "/downloadTicket.pdf", method = RequestMethod.GET)
	public void downloadTicket(HttpServletRequest request, HttpServletResponse response, TravellerDAO pdao)
			throws AdException {
		HttpSession session = request.getSession();

		long passenger_id = ((Long) session.getAttribute("passenger_id"));

		Traveller passenger = pdao.searchTraveller(passenger_id);

		FlightInformation flightDetail = (FlightInformation) session.getAttribute("flightdetail");

		try {

			response.setContentType("application/pdf");

			Document document = new Document();
			ByteArrayOutputStream pdf = new ByteArrayOutputStream();
			PdfWriter.getInstance(document, pdf);
			document.open();

			Paragraph title = new Paragraph("Below is Your Ticket Confirmation \n");
			Paragraph name = new Paragraph("Passenger Name :" + passenger.getFirstName() + " " + passenger.getLastName()+"\n");
			Paragraph flight = new Paragraph("Flight Name :  " + flightDetail.getFlight_name() + " \nFrom :  "
					+ flightDetail.getFrom() + " \nDestination : " + flightDetail.getDest());
			Paragraph deptDetails = new Paragraph(
					"\nDeparture Date :  " + flightDetail.getDeptDate() + "\nDeparture Time :  " + flightDetail.getDeptTime());
			Paragraph arrDetails = new Paragraph("\nDestination Arrival Date :  " + flightDetail.getArrDate()
					+ "\nDestination Arrival Time :  " + flightDetail.getArrivalTime());

			document.add(title);
			document.add(name);
			document.add(flight);
			document.add(deptDetails);
			document.add(arrDetails);

			document.close();

			ServletOutputStream out = response.getOutputStream();
			pdf.writeTo(out);
			out.flush();

		}

		catch (Exception e) {
			System.out.println("Could not add ticket object" + e.getMessage());
		}

	}

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/emailTicket.htm", method = RequestMethod.GET)
	public String emailTicket(HttpServletRequest request, TravellerDAO pdao) throws AdException {

		try {

			HttpSession session = request.getSession();
			long passenger_id = ((Long) session.getAttribute("passenger_id"));
			Traveller passenger = pdao.searchTraveller(passenger_id);
			FlightInformation flightDetail = (FlightInformation) session.getAttribute("flightdetail");

			SimpleMailMessage message = new SimpleMailMessage();

			message.setFrom("yourprogramtest@gmail.com");

			message.setTo(passenger.getEmail());

			message.setSubject("Ticket Confirmation");

			message.setText("Hello," + passenger.getFirstName() + " " + passenger.getLastName() + "\n"
					+ "Thank you for Flying Ticket with us. \nPlease find your flight details below " + "\n"
					+ "\nFlight Name :  " + flightDetail.getFlight_name() + " \nFrom :  " + flightDetail.getFrom()
					+ " \nDestination :  " + flightDetail.getDest() + "\n" + "Departure Date :  " + flightDetail.getDeptDate()
					+ "\nDeparture Time :  " + flightDetail.getDeptTime() + "\n" + "Destination Arrival Date :  "
					+ flightDetail.getArrDate() + "\nDestination Arrival Time :  " + flightDetail.getArrivalTime()+
					"\n\nHave a Safe Flight ");

			mailSender.send(message);

		} catch (Exception e) {
			System.out.println("Couldn't send email " + e.getMessage());
		}

		return "confirmation";
	}

	@RequestMapping(value = "/deleteTicket.htm", method = RequestMethod.GET)
	public String deleteTicket(HttpServletRequest request, TravellerDAO pdao, TravelTicketDAO tdao) throws AdException {
		try {
			HttpSession session = request.getSession();
			long passenger_id = ((Long) session.getAttribute("passenger_id"));
			Traveller passenger = pdao.searchTraveller(passenger_id);
			FlightInformation flightDetail = (FlightInformation) session.getAttribute("flightdetail");
			tdao.cancelTravelTicket(passenger, flightDetail);
		} catch (Exception e) {
			System.out.println("Could not cancel Ticket " + e.getMessage());
		}

		return "confirmation";
	}
}
