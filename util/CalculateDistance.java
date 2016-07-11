package com.pro.gis.util;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;


public class CalculateDistance {

	public static File zips = new File("./data/ZIPS_lat_lon");
	//public static String zips = "/data/ZIPS_lat_lon";
	public static HashMap<String,CentroidObject> zipCentroids = new HashMap<String,CentroidObject>();
	public static HashMap<String,CentroidObject> matches = new HashMap<String,CentroidObject>();
	public static String[] ids;
	static{
		BufferedReader reader;
		String line;
		try {			
			//InputStream is = ClassLoader.getSystemClassLoader().getResourceAsStream(zips);
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
		long start = (new Date()).toInstant().toEpochMilli();
		String str = getIDsWithinDistanceOfAsQueryInput("98133",20);
		long end = (new Date()).toInstant().toEpochMilli();
		System.out.println("Time taken: " + (end-start) + "\n Ids: " + str);
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
		
		double R = 3959.0000; // miles
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
	

}
