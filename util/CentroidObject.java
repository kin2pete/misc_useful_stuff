package com.pro.gis.util;

public class CentroidObject {
	public String id;
	public double lat;
	public double lon;
	public double distance;
	public static String header = "id,lat,lon,distance\n";
	public CentroidObject(String id, double lat, double lon){
		this.id=id;
		this.lat=lat;
		this.lon=lon;
	}
	public CentroidObject(String id, String lat, String lon){
		this.id=id;
		this.lat=Double.valueOf(lat);
		this.lon=Double.valueOf(lon);
	}
	@Override
	public String toString() {
		return "CentroidObject [id=" + id + ", lat=" + lat + ", lon=" + lon
				+ ", distance=" + distance + "]\n";
	}
	
	public String asCsv(){
		return id + "," + lat + "," + lon
				+ "," + distance;			
	}
	
}
