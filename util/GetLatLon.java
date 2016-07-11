package com.pro.gis.util;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pro.gis.json.CensusDotGovLocation;

public class GetLatLon {

	public static final String CENSUS_DOT_GOV_URL = "http://geocoding.geo.census.gov/geocoder/locations/address";
	
	public static CensusDotGovLocation getLatLon(String url) throws JsonParseException, JsonMappingException, IOException{
		URL link = new URL(url);
        ObjectMapper mapper = new ObjectMapper(); // can reuse, share globally
        CensusDotGovLocation location = mapper.readValue(link, CensusDotGovLocation.class);
        return location;
	}
	
	public static CensusDotGovLocation getLatLon(String street, String city, String state, String zip) throws JsonParseException, JsonMappingException, IOException{
		String url = CENSUS_DOT_GOV_URL + 
				"?street=" + street.replace(" ", "+").replace("#", "UNIT+") +
				"&city=" + city.replace(" ", "+") +
				"&state=" + state +
				"&zip=" + zip +
				"&benchmark=Public_AR_Census2010&format=json" ;
								
		return getLatLon(url);
	}
	
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
		
		HashMap<String, Double> distances = new HashMap<String, Double>();
		HashMap<String, HashSet<String>> graphPoints = new HashMap<String, HashSet<String>>();
		for(CentroidObject centroid1:centroids){
			for(CentroidObject centroid2:centroids){
				if(!centroid1.id.equals(centroid2.id)){
					distances.put(
							centroid1.id.hashCode() + ","+ centroid2.id.hashCode() , 
							CalculateDistance.distance(centroid1, centroid2));	
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
//		debug("distances: " + distances);
//		debug("graphPoints: " + graphPoints);
		//debug(getNearestNeighbor(""+centroids.get(0).id.hashCode(), graphPoints, distances));
	}
	

	public static void debug(String str) {
		System.out.println(str);
	}
	
	
	
}
