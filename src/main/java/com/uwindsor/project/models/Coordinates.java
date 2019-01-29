package com.uwindsor.project.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * @author Afnan Ur Rehman
 */
@Entity
@Table(name = "coordinates")
public class Coordinates {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@Column(name = "longitude", nullable = false)
	private double longitude;
	
	@Column(name = "latitude", nullable = false)
	private double latitude;
	
	@Column(name = "address", nullable = false)
	private String address;
	
	@OneToMany(mappedBy = "coordinates", fetch = FetchType.EAGER)
	private List<RentDetails> rentDetails;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Coordinates() {
	}
	public Coordinates(int id, double longitude, double latitude, String address) {
		super();
		this.id = id;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
	}
	@Override
	public String toString() {
		return "Coordinates [id=" + id + ", longitude=" + longitude + ", latitude=" + latitude + ", address=" + address + "]";
	}
	
}
