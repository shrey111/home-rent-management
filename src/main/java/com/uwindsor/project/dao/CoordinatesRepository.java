package com.uwindsor.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.uwindsor.project.models.Coordinates;
/**
 * @author Afnan Ur Rehman
 */
@Repository("coordinatesRepository")
public interface CoordinatesRepository extends CrudRepository<Coordinates, Integer>{
	
	public List<Coordinates> findByRentDetails_Id(Integer id); 
	
}
