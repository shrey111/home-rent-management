package com.uwindsor.project.service;

import java.util.List;

import com.uwindsor.project.models.RentDetails;
/**
 * @author Afnan Ur Rehman
 */
public interface RentDetailsService {

	public Iterable<RentDetails> finalAll();
	
	public void saveCoordinates(RentDetails rentDetails);
	
	public List<RentDetails> listAllCoordinates();
	
	public RentDetails findCoordinatesById(int id);
	
}
