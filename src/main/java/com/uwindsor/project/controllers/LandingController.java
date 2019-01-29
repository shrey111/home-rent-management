package com.uwindsor.project.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwindsor.project.models.Coordinates;
import com.uwindsor.project.models.RentDetails;
import com.uwindsor.project.service.CoordinatesService;
import com.uwindsor.project.service.RentDetailsService;

/**
 * @author Afnan Ur Rehman
 */
@Controller
public class LandingController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LandingController.class);

	// @Autowired
	// private DataSource dataSource;

	@Autowired
	private CoordinatesService coordinatesService;

	@Autowired
	private RentDetailsService rentDetailsService;

	// @RequestMapping(value="/welcome")
	// public void homePage(){
	//// JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	//// List<Map<String,Object>> coordinateList = jdbcTemplate.queryForList("SELECT
	// * FROM `rentHome`.`Coordinates`");
	//// for (Map<String, Object> coordinate : coordinateList) {
	//// LOGGER.debug("--------------------"+coordinate.get("longitude"));
	//// }
	//// Coordinates coordinates = new Coordinates(1, 42.30985169999999,
	// -83.05519340000001);
	//// coordinatesService.saveCoordinates(coordinates);
	// for (Coordinates c : coordinatesService.finalAll()) {
	// LOGGER.debug("+++++++++++++"+c.toString());
	// }
	// for (RentDetails r : rentDetailsService.finalAll()) {
	// LOGGER.debug("+++++++++++++"+r.toString());
	// }
	// //LOGGER.debug(coordinatesService.findCoordinatesById(1).toString());
	//
	// }
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(ModelMap model) {

		for (Coordinates c : coordinatesService.finalAll()) {
			LOGGER.debug("+++++++++++++" + c.toString());
		}
		for (RentDetails r : rentDetailsService.finalAll()) {
			LOGGER.debug("+++++++++++++" + r.toString());
		}
		// LOGGER.debug(coordinatesService.findCoordinatesById(1).toString());

		model.put("coordinates", coordinatesService.finalAll());
		model.put("rentdetails", rentDetailsService.finalAll());

		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleUserLogin(ModelMap model, @RequestParam String houseNumber, @RequestParam String streetName,
			@RequestParam String cityName, @RequestParam String provinceName, @RequestParam String country,
			@RequestParam String postalCode, @RequestParam String rent, @RequestParam String date) {
		LOGGER.debug("++++++++++++++++++++++++++++++++" + houseNumber + " and " + streetName);
		return "redirect:/";
	}

}
