package com.pro.gis.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public class NearestNeighborAlgorithm  extends GetLatLon{


	
	public static void main (String[] args) throws JsonParseException, JsonMappingException, IOException{
		
		//String url = "http://geocoding.geo.census.gov/geocoder/locations/address?street=4600+Silver+Hill+Rd&city=Suitland&state=MD&zip=20746&benchmark=Public_AR_Census2010&format=json";
		
		ArrayList<CentroidObject> centroids = new ArrayList<CentroidObject>();
		centroids.add(getLatLon("1014 233rd PL NE","Sammamish","WA","98074").toCentroid());
		centroids.add(getLatLon("3218 34th Ave W","Seattle","WA","98199").toCentroid());
		centroids.add(getLatLon("6222 S. 118th Pl","Seattle","WA","98178").toCentroid());
		centroids.add(getLatLon("5721 Kensington Place North","Seattle ","WA ","98103").toCentroid());
		centroids.add(getLatLon("23947 SE 40th Pl","Issaquah","WA","98029").toCentroid());
		centroids.add(getLatLon("2900 25th Ave W","Seattle","WA","98109").toCentroid());
		centroids.add(getLatLon("137 nw 84th st; ","seattle","WA","98117").toCentroid());
		centroids.add(getLatLon("3823 23rd Ave SW unit B","Seattle","WA","98106").toCentroid());
		centroids.add(getLatLon("569 Lee St #4","Seattle","WA","98109").toCentroid());
		
		long start = (new Date()).toInstant().toEpochMilli();

		HashMap<String, Double> distances = new HashMap<String, Double>();
		HashMap<String, HashSet<String>> graphPoints = new HashMap<String, HashSet<String>>();
		for(CentroidObject centroid1:centroids){
			for(CentroidObject centroid2:centroids){
				if(!centroid1.id.equals(centroid2.id)){
					distances.put(
							centroid1.id.hashCode() + ","+ centroid2.id.hashCode() , 
							distance(centroid1, centroid2));	
					if(!graphPoints.containsKey(""+centroid1.id.hashCode())){
						HashSet<String> keys = new HashSet<String>();
						graphPoints.put(
								""+centroid1.id.hashCode(), 
								keys);
					}
					graphPoints.get(""+centroid1.id.hashCode()).add(centroid1.id.hashCode() + ","+ centroid2.id.hashCode());
				}
			}
		}
		long setup = (new Date()).toInstant().toEpochMilli();
		System.out.println("Time taken in setup: " + (setup-start) );
		long compute = (new Date()).toInstant().toEpochMilli();
		
		Double minDistance = 1000000.00;
		Vertice[] bestPath=null;
		for(int i=0;i<centroids.size();i++){
			Vertice[] path = doNearestNeighborVisitFor(""+centroids.get(i).id.hashCode(), graphPoints, distances);
			Double temp = getDistanceForPath(path);
			if(temp<minDistance){;
				minDistance = temp;
				bestPath = path;
			}
		}
				
		long end = (new Date()).toInstant().toEpochMilli();
		System.out.println(end + ": " + compute + " =>Time taken in compute: " + (end-compute) );
		System.out.print("Best path is: " );
		printPath(bestPath);
		System.out.print(" Distance: " + minDistance );
		
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
	
	
	public static Vertice getNearestNeighbor(String start, HashMap<String, HashSet<String>> graphPoints,HashMap<String, Double> distances, HashSet<String> ignoreSet){
		
		Double min = 1000000.0;
		String nearest = "";
		HashSet<String> vertices = graphPoints.get(start);
		for(String vertice:vertices){
			String nextPoint = vertice.split(",")[1];
			if(distances.get(vertice)<min && !ignoreSet.contains(nextPoint)){
				min = distances.get(vertice);
				nearest = nextPoint;
			}
		}
		Vertice point = new Vertice();
		point.start=start;
		point.end=nearest;
		point.distance=min;
		return point;
	}
	
	public static Vertice[] doNearestNeighborVisitFor(String start,HashMap<String, HashSet<String>> graphPoints,HashMap<String, Double> distances){
		
		Vertice[] vertices = new Vertice[graphPoints.size()];
		HashSet<String> ignoreSet = new HashSet<String>();
		String temp = start;
		for(int i=0;i<vertices.length;i++){
			vertices[i] = getNearestNeighbor(temp, graphPoints, distances, ignoreSet);
			ignoreSet.add(temp);
			temp = vertices[i].end;
		}
		printPath(vertices);
		return vertices;
	}
	
	public static Double getDistanceForPath(Vertice[] path){
		Double distance = 0.0;
		for(int i=0;i<path.length-1;i++){
			distance += path[i].distance;
		}
		return distance;
	}
	
	public static void printPath(String[] path){
		System.out.print("[ ");
		for(int i=0;i<path.length;i++){
			if(i==path.length-1){
				System.out.println(" \"" + path[i] + "\" ]");				
			}else{
				System.out.print(" \"" + path[i] + "\",");
			}
			
		}
	}
	public static void printPath(Vertice[] path){
		System.out.print("[ ");
		for(int i=0;i<path.length;i++){
			if(i==path.length-1){
				System.out.println(" \"" + path[i] + "\" ]");				
			}else{
				System.out.print(" \"" + path[i] + "\",");
			}
			
		}
	}
	public static class Vertice{
		public String start;
		public String end;
		public Double distance;
		@Override
		public String toString() {
			// TODO Auto-generated method stub
			return start +","+ end;
		}
	}
	
}
