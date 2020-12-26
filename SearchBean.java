package com.beans.pkg;

import java.io.Serializable;

public class SearchBean implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	
	String origin;
	String destination;
	String dateOfTravel;
	
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDateOfTravel() {
		return dateOfTravel;
	}
	public void setDateOfTravel(String dateOfTravel) {
		this.dateOfTravel = dateOfTravel;
	}

}
