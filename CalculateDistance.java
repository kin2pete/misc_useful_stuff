package com.pro.gis.util;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;


public class CalculateDistance {

	public static File zips = new File("./ZIPS_lat_lon");
	public static HashMap<String,CalculateDistance.CentroidObject> zipCentroids = new HashMap<String,CalculateDistance.CentroidObject>();
	public static HashMap<String,CalculateDistance.CentroidObject> matches = new HashMap<String,CalculateDistance.CentroidObject>();
	public static String[] ids;
	static{
		BufferedReader reader;
		String line;
		try {
			reader = new BufferedReader(new FileReader(zips));
			while((line=reader.readLine())!=null){
				String[] args = line.split(" ");
				zipCentroids.put(args[0],new CentroidObject(args[0],args[1],args[2]));
			};
			System.out.println("Read " + zipCentroids.size() + " effective ZIPs");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		CentroidObject a = new 	CentroidObject("a", 45.557741999999998, -122.178567);
		System.out.println(getIDsWithinDistanceOfAsQueryInput("98133",20));
	}

	public static HashMap<String, CentroidObject> getCentroidsWithinDistanceOf(String centroidId,double distance){		
		CentroidObject a = zipCentroids.get(centroidId);
		return getCentroidsWithinDistanceOf(a,distance);
	}
	
	public static HashMap<String, CentroidObject> getCentroidsWithinDistanceOf(double lat, double lon,double distance){		
		CentroidObject a = new 	CentroidObject("anon", lat, lon);
		return getCentroidsWithinDistanceOf(a,distance);
	}

	public static String[] getIDsWithinDistanceOf(String centroidId,double distance){		
		CentroidObject a = zipCentroids.get(centroidId);
		return getIDsWithinDistanceOf(a,distance);
	}
	
	public static String[] getIDsWithinDistanceOf(double lat, double lon,double distance){		
		CentroidObject a = new 	CentroidObject("anon", lat, lon);
		return getIDsWithinDistanceOf(a,distance);
	}

	public static String[] getIDsWithinDistanceOf(CentroidObject a,double distance){		
		return (String[])(getCentroidsWithinDistanceOf(a,distance).keySet().toArray());
	}
	
	public static HashMap<String, CentroidObject> getCentroidsWithinDistanceOf(CentroidObject a,double distance){		
		matches.clear();
		for (CentroidObject b : zipCentroids.values()){
			b.distance= CalculateDistance.distance(a, b);	
			if(b.distance<distance){
				matches.put(b.id,b);
			}		
		}
		return matches;
	}
	

	public static String getIDsWithinDistanceOfAsQueryInput(String centroidId,double distance){
		String out="";
		getCentroidsWithinDistanceOf(centroidId,distance);
		if(matches.size()>0){
			out="(";
			for (String id : matches.keySet()){
				out += "'" + id +"',";
			}
			out = out.substring(0, out.length()-1);
			out = out +")";
		}
		return out;
	}
	
	public static double distance (CentroidObject start, CentroidObject end){
		
		double R = 3959.00; // miles
		double φ1 = Math.toRadians(start.lat);
		double φ2 = Math.toRadians(end.lat);
		double Δφ = Math.toRadians((end.lat-start.lat));
		double Δλ = Math.toRadians((end.lon-start.lon));

		double a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
		        Math.cos(φ1) * Math.cos(φ2) *
		        Math.sin(Δλ/2) * Math.sin(Δλ/2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double d = R * c;		
	    return d;
	}

	public static String asCsv(){
		StringBuffer buff = new StringBuffer();
		buff.append(CentroidObject.header);
		for(CentroidObject obj : matches.values()){
			buff.append(obj.asCsv());
			buff.append("\n");
		}
		return buff.toString();
	}
	
	public static class CentroidObject {
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
}
