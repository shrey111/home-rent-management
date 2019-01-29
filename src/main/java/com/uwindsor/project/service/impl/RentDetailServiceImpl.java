package com.uwindsor.project.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.uwindsor.project.dao.RentDetailsRepository;
import com.uwindsor.project.models.RentDetails;
import com.uwindsor.project.service.RentDetailsService;
/**
 * @author Afnan Ur Rehman
 */
@Service("rentDetailServiceImpl")
@Transactional
public class RentDetailServiceImpl implements RentDetailsService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RentDetailServiceImpl.class);
	
	@Autowired
	private RentDetailsRepository rentDetailsRepository;
	
	@Override
	public Iterable<RentDetails> finalAll() {
		LOGGER.debug("Iterable<RentDetails> finalAll() method has been invoked!");
		return rentDetailsRepository.findAll();
	}

	@Override
	public void saveCoordinates(RentDetails rentDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RentDetails> listAllCoordinates() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RentDetails findCoordinatesById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
