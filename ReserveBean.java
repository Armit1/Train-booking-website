package com.beans.pkg;

import java.io.Serializable;

public class ReserveBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private int trainID;
	private String stopSt;
	private String travel_dateTime;
	
	public String getTravel_dateTime() {
		return travel_dateTime;
	}
	public void setTravel_dateTime(String travel_date) {
		this.travel_dateTime = travel_date;
	}
	private int is_roundTrip;
	private int fare;
	
	public String getStopSt() {
		return stopSt;
	}
	public void setStopSt(String stopSt) {
		this.stopSt = stopSt;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getTrainID() {
		return trainID;
	}
	public void setTrainID(int trainID) {
		this.trainID = trainID;
	}

	public int getIs_roundTrip() {
		return is_roundTrip;
	}
	public void setIs_roundTrip(int is_roundTrip) {
		this.is_roundTrip = is_roundTrip;
	}
	public int getFare() {
		return fare;
	}
	public void setFare(int fare) {
		this.fare = fare;
	}
	
	
	
	
}
