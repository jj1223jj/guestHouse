package com.java.host.dto;

import java.util.Date;

public class HostDto {

	private int houseCode;
	private int memberCode;
	private String houseName;
	private String explain;
	private int bath;
	private String etc;
	private String checkInTime;
	private String checkOutTime;
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
	private String address;
	private String sido;
	private String sigungu;
	private String roadName;
	private String bName;
	private String jibunAddress;
	private String latLng;
	private String detailAddress;
	private String local;
	private String approvalStatus;
	private String bank;
	private long account;
	private int people;
	private int bed;
	private int price;
	private Date houseRegDate;
	
	public HostDto() {
		
	}

	public HostDto(int houseCode, int memberCode, String houseName, String explain, int bath, String etc,
			String checkInTime, String checkOutTime, String necessary, String wifi, String washer, String hotWater,
			String aircon, String tv, String mart, String parking, String kitchen, String safety, String address,
			String sido, String sigungu, String roadName, String bName, String jibunAddress, String latLng,
			String detailAddress, String local, String approvalStatus, String bank, long account, int people, int bed,
			int price, Date houseRegDate) {
		this.houseCode = houseCode;
		this.memberCode = memberCode;
		this.houseName = houseName;
		this.explain = explain;
		this.bath = bath;
		this.etc = etc;
		this.checkInTime = checkInTime;
		this.checkOutTime = checkOutTime;
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
		this.address = address;
		this.sido = sido;
		this.sigungu = sigungu;
		this.roadName = roadName;
		this.bName = bName;
		this.jibunAddress = jibunAddress;
		this.latLng = latLng;
		this.detailAddress = detailAddress;
		this.local = local;
		this.approvalStatus = approvalStatus;
		this.bank = bank;
		this.account = account;
		this.people = people;
		this.bed = bed;
		this.price = price;
		this.houseRegDate = houseRegDate;
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

	public int getBath() {
		return bath;
	}

	public void setBath(int bath) {
		this.bath = bath;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}

	public String getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
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

	public String getjibunAddress() {
		return jibunAddress;
	}

	public void setjibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
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

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public long getAccount() {
		return account;
	}

	public void setAccount(long account) {
		this.account = account;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getHouseRegDate() {
		return houseRegDate;
	}

	public void setHouseRegDate(Date houseRegDate) {
		this.houseRegDate = houseRegDate;
	}

	@Override
	public String toString() {
		return "HostDto [houseCode=" + houseCode + ", memberCode=" + memberCode + ", houseName=" + houseName
				+ ", explain=" + explain + ", bath=" + bath + ", etc=" + etc + ", checkInTime=" + checkInTime + ", checkOutTime="
				+ checkOutTime + ", necessary=" + necessary + ", wifi=" + wifi + ", washer=" + washer + ", hotWater="
				+ hotWater + ", aircon=" + aircon + ", tv=" + tv + ", mart=" + mart + ", parking=" + parking
				+ ", kitchen=" + kitchen + ", safety=" + safety + ", address=" + address + ", sido=" + sido
				+ ", sigungu=" + sigungu + ", roadName=" + roadName + ", bName=" + bName + ", jibunAddress="
				+ jibunAddress + ", latLng=" + latLng + ", detailAddress=" + detailAddress + ", local=" + local
				+ ", approvalStatus=" + approvalStatus + ", bank=" + bank + ", account=" + account + ", people="
				+ people + ", bed=" + bed + ", price=" + price + ", houseRegDate=" + houseRegDate + "]";
	}
	
	
	
	


}
