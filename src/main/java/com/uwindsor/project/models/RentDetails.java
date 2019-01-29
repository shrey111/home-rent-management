package com.uwindsor.project.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * @author Afnan Ur Rehman
 */
@Entity
@Table(name = "rentDetails")
public class RentDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "coordinates_id", nullable = false)
	private Coordinates coordinates;

	@Column(name = "rent", nullable = false)
	private int rent;

	@Column(name = "rentDate", nullable = false)
	private String rentDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public String getRentDate() {
		return rentDate;
	}

	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}

	public Coordinates getCoordinates() {
		return coordinates;
	}

	public void setCoordinates(Coordinates coordinates) {
		this.coordinates = coordinates;
	}

	public RentDetails() {
	}
	
	public RentDetails(int id, Coordinates coordinates, int rent, String rentDate) {
		super();
		this.id = id;
		this.coordinates = coordinates;
		this.rent = rent;
		this.rentDate = rentDate;
	}

	@Override
	public String toString() {
		return "RentDetails [id=" + id + ", coordinates=" + coordinates + ", rent=" + rent + ", rentDate=" + rentDate
				+ "]";
	}
	
}
