package com.uwindsor.project.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.uwindsor.project.models.Coordinates;
import com.uwindsor.project.models.RentDetails;
/**
 * @author Afnan Ur Rehman
 */
@Repository("rentDetailsRepository")
public interface RentDetailsRepository extends CrudRepository<RentDetails, Integer>{

}
