package com.java.search.dto;

public class SearchDto {
	private int houseCode;
	private int memberCode;
	private String houseName;
	private String explain;
	private String etc;
	private String checkIn;
	private String checkOut;
	private String necessary;
	private String wifi;
	private String washer;
	private String hotWater;
	private String aircon;
	private String tv;
	private String mart;
	private String parking;
	private String kitchen;
	private String safety;
	private String houseImgName;
	private String houseImgPath;
	private String houseImgSize;
	private String address;
	private String sido;
	private String sigungu;
	private String roadName;
	private String bName;
	private String autoJibunAddress;
	private String latLng;
	private String detailAddress;
	
	public SearchDto() {}
	public SearchDto(int houseCode, int memberCode, String houseName, String explain, String etc, String checkIn,
			String checkOut, String necessary, String wifi, String washer, String hotWater, String aircon, String tv,
			String mart, String parking, String kitchen, String safety, String houseImgName, String houseImgPath,
			String houseImgSize, String address, String sido, String sigungu, String roadName, String bName,
			String autoJibunAddress, String latLng, String detailAddress) {
		this.houseCode = houseCode;
		this.memberCode = memberCode;
		this.houseName = houseName;
		this.explain = explain;
		this.etc = etc;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.necessary = necessary;
		this.wifi = wifi;
		this.washer = washer;
		this.hotWater = hotWater;
		this.aircon = aircon;
		this.tv = tv;
		this.mart = mart;
		this.parking = parking;
		this.kitchen = kitchen;
		this.safety = safety;
		this.houseImgName = houseImgName;
		this.houseImgPath = houseImgPath;
		this.houseImgSize = houseImgSize;
		this.address = address;
		this.sido = sido;
		this.sigungu = sigungu;
		this.roadName = roadName;
		this.bName = bName;
		this.autoJibunAddress = autoJibunAddress;
		this.latLng = latLng;
		this.detailAddress = detailAddress;
	}
	public int getHouseCode() {
		return houseCode;
	}
	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getNecessary() {
		return necessary;
	}
	public void setNecessary(String necessary) {
		this.necessary = necessary;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getWasher() {
		return washer;
	}
	public void setWasher(String washer) {
		this.washer = washer;
	}
	public String getHotWater() {
		return hotWater;
	}
	public void setHotWater(String hotWater) {
		this.hotWater = hotWater;
	}
	public String getAircon() {
		return aircon;
	}
	public void setAircon(String aircon) {
		this.aircon = aircon;
	}
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public String getMart() {
		return mart;
	}
	public void setMart(String mart) {
		this.mart = mart;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getKitchen() {
		return kitchen;
	}
	public void setKitchen(String kitchen) {
		this.kitchen = kitchen;
	}
	public String getSafety() {
		return safety;
	}
	public void setSafety(String safety) {
		this.safety = safety;
	}
	public String getHouseImgName() {
		return houseImgName;
	}
	public void setHouseImgName(String houseImgName) {
		this.houseImgName = houseImgName;
	}
	public String getHouseImgPath() {
		return houseImgPath;
	}
	public void setHouseImgPath(String houseImgPath) {
		this.houseImgPath = houseImgPath;
	}
	public String getHouseImgSize() {
		return houseImgSize;
	}
	public void setHouseImgSize(String houseImgSize) {
		this.houseImgSize = houseImgSize;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getRoadName() {
		return roadName;
	}
	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getAutoJibunAddress() {
		return autoJibunAddress;
	}
	public void setAutoJibunAddress(String autoJibunAddress) {
		this.autoJibunAddress = autoJibunAddress;
	}
	public String getLatLng() {
		return latLng;
	}
	public void setLatLng(String latLng) {
		this.latLng = latLng;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	@Override
	public String toString() {
		return "SearchDto [houseCode=" + houseCode + ", memberCode=" + memberCode + ", houseName=" + houseName
				+ ", explain=" + explain + ", etc=" + etc + ", checkIn=" + checkIn + ", checkOut=" + checkOut
				+ ", necessary=" + necessary + ", wifi=" + wifi + ", washer=" + washer + ", hotWater=" + hotWater
				+ ", aircon=" + aircon + ", tv=" + tv + ", mart=" + mart + ", parking=" + parking + ", kitchen="
				+ kitchen + ", safety=" + safety + ", houseImgName=" + houseImgName + ", houseImgPath=" + houseImgPath
				+ ", houseImgSize=" + houseImgSize + ", address=" + address + ", sido=" + sido + ", sigungu=" + sigungu
				+ ", roadName=" + roadName + ", bName=" + bName + ", autoJibunAddress=" + autoJibunAddress + ", latLng="
				+ latLng + ", detailAddress=" + detailAddress + ", getHouseCode()=" + getHouseCode()
				+ ", getMemberCode()=" + getMemberCode() + ", getHouseName()=" + getHouseName() + ", getExplain()="
				+ getExplain() + ", getEtc()=" + getEtc() + ", getCheckIn()=" + getCheckIn() + ", getCheckOut()="
				+ getCheckOut() + ", getNecessary()=" + getNecessary() + ", getWifi()=" + getWifi() + ", getWasher()="
				+ getWasher() + ", getHotWater()=" + getHotWater() + ", getAircon()=" + getAircon() + ", getTv()="
				+ getTv() + ", getMart()=" + getMart() + ", getParking()=" + getParking() + ", getKitchen()="
				+ getKitchen() + ", getSafety()=" + getSafety() + ", getHouseImgName()=" + getHouseImgName()
				+ ", getHouseImgPath()=" + getHouseImgPath() + ", getHouseImgSize()=" + getHouseImgSize()
				+ ", getAddress()=" + getAddress() + ", getSido()=" + getSido() + ", getSigungu()=" + getSigungu()
				+ ", getRoadName()=" + getRoadName() + ", getbName()=" + getbName() + ", getAutoJibunAddress()="
				+ getAutoJibunAddress() + ", getLatLng()=" + getLatLng() + ", getDetailAddress()=" + getDetailAddress()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}