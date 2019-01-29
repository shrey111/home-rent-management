package com.uwindsor.project.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;
import com.uwindsor.project.dao.CoordinatesRepository;
import com.uwindsor.project.models.Coordinates;
import com.uwindsor.project.service.CoordinatesService;
/**
 * @author Afnan Ur Rehman
 */
@Service("coordinatesService")
@Transactional
public class CoordinatesServiceImpl implements CoordinatesService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CoordinatesServiceImpl.class);
	
	@Autowired
	private CoordinatesRepository coordinatesRepository;
	
	public Iterable<Coordinates> finalAll(){
		LOGGER.debug("Iterable<Coordinates> finalAll() method has been invoked!");
		return coordinatesRepository.findAll();
	}

	@Override
	public void saveCoordinates(Coordinates coordinates) {
		LOGGER.debug("Save Coordinates has been invoked!");
		coordinatesRepository.save(coordinates);
		LOGGER.debug("Coordinates object has been saved!");
	}

	@Override
	public List<Coordinates> listAllCoordinates() {
		return null;
	}

	@Override
	public Coordinates findCoordinatesById(int id) {
		LOGGER.debug("Find Coordinates by Id has been invoked!");
		return coordinatesRepository.findOne(id);
	}
	
}
