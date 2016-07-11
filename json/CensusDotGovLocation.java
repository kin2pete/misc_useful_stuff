package com.pro.gis.json;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pro.gis.util.CentroidObject;


@JsonIgnoreProperties(ignoreUnknown=true)
public class CensusDotGovLocation {


	@JsonIgnore
	public CentroidObject toCentroid(){
		return new CentroidObject(getResult().getAddressMatches()[0].getMatchedAddress(), 
				getResult().getAddressMatches()[0].getCoordinates().x, 
				getResult().getAddressMatches()[0].getCoordinates().y);
	}
	
	public Result result;
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public Result getResult() {
		return result;
	}
	public void setResult(Result result) {
		this.result = result;
	}
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public static class Result{
		Input input;
		MatchedAddress[] addressMatches;
		public Input getInput() {
			return input;
		}
		public void setInput(Input input) {
			this.input = input;
		}
		public MatchedAddress[] getAddressMatches() {
			return addressMatches;
		}
		public void setAddressMatches(MatchedAddress[] addressMatches) {
			this.addressMatches = addressMatches;
		}
		@Override
		public String toString() {
			return "Result [input=" + input + ", addressMatches="
					+ Arrays.toString(addressMatches) + "]";
		}		
		
	}
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public static class Input {
		Address address;
		Benchmark benchmark;
		public Address getAddress() {
			return address;
		}
		public void setAddress(Address address) {
			this.address = address;
		}
		public Benchmark getBenchmark() {
			return benchmark;
		}
		public void setBenchmark(Benchmark benchmark) {
			this.benchmark = benchmark;
		}
		@Override
		public String toString() {
			return "Input [address=" + address + ", benchmark=" + benchmark
					+ "]";
		}
		
	}
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public static class Address {
		String state;
		String street;
		String zip;
		String city;
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getStreet() {
			return street;
		}
		public void setStreet(String street) {
			this.street = street;
		}
		public String getZip() {
			return zip;
		}
		public void setZip(String zip) {
			this.zip = zip;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		@Override
		public String toString() {
			return "Address [state=" + state + ", street=" + street + ", zip="
					+ zip + ", city=" + city + "]";
		}		
		
	}
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public static class Benchmark {
		String id;
		String benchmarkName;
		String benchmarkDescription;
		boolean isDefault;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getBenchmarkName() {
			return benchmarkName;
		}
		public void setBenchmarkName(String benchmarkName) {
			this.benchmarkName = benchmarkName;
		}
		public String getBenchmarkDescription() {
			return benchmarkDescription;
		}
		public void setBenchmarkDescription(String benchmarkDescription) {
			this.benchmarkDescription = benchmarkDescription;
		}
		public boolean isDefault() {
			return isDefault;
		}
		public void setDefault(boolean isDefault) {
			this.isDefault = isDefault;
		}
		@Override
		public String toString() {
			return "Benchmark [id=" + id + ", benchmarkName=" + benchmarkName
					+ ", benchmarkDescription=" + benchmarkDescription
					+ ", isDefault=" + isDefault + "]";
		}
		
	}
	
	public static class MatchedAddress {
		String matchedAddress;
		Coordinates coordinates;
		TigerLine tigerLine;
		AddressComponents addressComponents;
		public String getMatchedAddress() {
			return matchedAddress;
		}
		public void setMatchedAddress(String matchedAddress) {
			this.matchedAddress = matchedAddress;
		}
		public Coordinates getCoordinates() {
			return coordinates;
		}
		public void setCoordinates(Coordinates coordinates) {
			this.coordinates = coordinates;
		}
		public TigerLine getTigerLine() {
			return tigerLine;
		}
		public void setTigerLine(TigerLine tigerLine) {
			this.tigerLine = tigerLine;
		}
		public AddressComponents getAddressComponents() {
			return addressComponents;
		}
		public void setAddressComponents(AddressComponents addressComponents) {
			this.addressComponents = addressComponents;
		}
		@Override
		public String toString() {
			return "MatchedAddress [matchedAddress=" + matchedAddress
					+ ", coordinates=" + coordinates + ", tigerLine="
					+ tigerLine + ", addressComponents=" + addressComponents
					+ "]";
		}		
	}
	
	public static class AddressComponents {
		String preQualifier;
		String preDirection;
		String preType;
		String  streetName;
		String fromAddress;
		String toAddress;
		String suffixType;
		String  suffixDirection;
		String  suffixQualifier;
		String  state;
		String  zip;
		String  city;
		public String getPreQualifier() {
			return preQualifier;
		}
		public void setPreQualifier(String preQualifier) {
			this.preQualifier = preQualifier;
		}
		public String getPreDirection() {
			return preDirection;
		}
		public void setPreDirection(String preDirection) {
			this.preDirection = preDirection;
		}
		public String getPreType() {
			return preType;
		}
		public void setPreType(String preType) {
			this.preType = preType;
		}
		public String getStreetName() {
			return streetName;
		}
		public void setStreetName(String streetName) {
			this.streetName = streetName;
		}
		public String getFromAddress() {
			return fromAddress;
		}
		public void setFromAddress(String fromAddress) {
			this.fromAddress = fromAddress;
		}
		public String getToAddress() {
			return toAddress;
		}
		public void setToAddress(String toAddress) {
			this.toAddress = toAddress;
		}
		public String getSuffixType() {
			return suffixType;
		}
		public void setSuffixType(String suffixType) {
			this.suffixType = suffixType;
		}
		public String getSuffixDirection() {
			return suffixDirection;
		}
		public void setSuffixDirection(String suffixDirection) {
			this.suffixDirection = suffixDirection;
		}
		public String getSuffixQualifier() {
			return suffixQualifier;
		}
		public void setSuffixQualifier(String suffixQualifier) {
			this.suffixQualifier = suffixQualifier;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getZip() {
			return zip;
		}
		public void setZip(String zip) {
			this.zip = zip;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		@Override
		public String toString() {
			return "AddressComponents [preQualifier=" + preQualifier
					+ ", preDirection=" + preDirection + ", preType=" + preType
					+ ", streetName=" + streetName + ", fromAddress="
					+ fromAddress + ", toAddress=" + toAddress
					+ ", suffixType=" + suffixType + ", suffixDirection="
					+ suffixDirection + ", suffixQualifier=" + suffixQualifier
					+ ", state=" + state + ", zip=" + zip + ", city=" + city
					+ "]";
		}
		
	}
	
	public static class TigerLine {
		String tigerLineId;
		String side;
		public String getTigerLineId() {
			return tigerLineId;
		}
		public void setTigerLineId(String tigerLineId) {
			this.tigerLineId = tigerLineId;
		}
		public String getSide() {
			return side;
		}
		public void setSide(String side) {
			this.side = side;
		}
		@Override
		public String toString() {
			return "TigerLine [tigerLineId=" + tigerLineId + ", side=" + side
					+ "]";
		}
		
	}
	public static class Coordinates{
		Double x;
		Double y;
		public Double getX() {
			return x;
		}
		public void setX(Double x) {
			this.x = x;
		}
		public Double getY() {
			return y;
		}
		public void setY(Double y) {
			this.y = y;
		}
		@Override
		public String toString() {
			return "Coordinates [x=" + x + ", y=" + y + "]";
		}
		
	}
	@Override
	public String toString() {
		return "CensusDotGovLocation [result=" + result + "]";
	}

}

