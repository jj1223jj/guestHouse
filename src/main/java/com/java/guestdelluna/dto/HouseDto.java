package com.java.guestdelluna.dto;

import java.util.Date;

public class HouseDto {

	private int houseCode ;
	private int memberCode;
	private String houseName ;
	private String zipCode ;
	private String explain;
	private int bath;
	private String etc;
	private Date checkIn ;
	private Date checkOut ;
	private String necessary;
	private String wifi ;
	private String washer ;
	private String hotWater;
	private String aircon;
	private String tv ;
	private String mart ;
	private String parking;
	private String kitchen ;
	private String safety ;
	private String address;
	private String sido;
	private String sigungu ;
	private String roadname ;
	private String bname ;
	private String jibunaddress ;
	private String latlng ;
	private String detailaddress ;
	private String local ;
	private String approvalstatus;
	private String bank;
	private int account ;
	private int people ;
	private int bed ;
	private int price ;
	private Date houseRegDate ;

	public HouseDto() {}

	public HouseDto(int houseCode, int memberCode, String houseName, String zipCode, String explain, int bath,
			String etc, Date checkIn, Date checkOut, String necessary, String wifi, String washer, String hotWater,
			String aircon, String tv, String mart, String parking, String kitchen, String safety, String address,
			String sido, String sigungu, String roadname, String bname, String jibunaddress, String latlng,
			String detailaddress, String local, String approvalstatus, String bank, int account, int people, int bed,
			int price, Date houseRegDate) {
		
		this.houseCode = houseCode;
		this.memberCode = memberCode;
		this.houseName = houseName;
		this.zipCode = zipCode;
		this.explain = explain;
		this.bath = bath;
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
		this.address = address;
		this.sido = sido;
		this.sigungu = sigungu;
		this.roadname = roadname;
		this.bname = bname;
		this.jibunaddress = jibunaddress;
		this.latlng = latlng;
		this.detailaddress = detailaddress;
		this.local = local;
		this.approvalstatus = approvalstatus;
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

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
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

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
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

	public String getRoadname() {
		return roadname;
	}

	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getJibunaddress() {
		return jibunaddress;
	}

	public void setJibunaddress(String jibunaddress) {
		this.jibunaddress = jibunaddress;
	}

	public String getLatlng() {
		return latlng;
	}

	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getApprovalstatus() {
		return approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
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
		return "HouseDto [houseCode=" + houseCode + ", memberCode=" + memberCode + ", houseName=" + houseName
				+ ", zipCode=" + zipCode + ", explain=" + explain + ", bath=" + bath + ", etc=" + etc + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", necessary=" + necessary + ", wifi=" + wifi + ", washer="
				+ washer + ", hotWater=" + hotWater + ", aircon=" + aircon + ", tv=" + tv + ", mart=" + mart
				+ ", parking=" + parking + ", kitchen=" + kitchen + ", safety=" + safety + ", address=" + address
				+ ", sido=" + sido + ", sigungu=" + sigungu + ", roadname=" + roadname + ", bname=" + bname
				+ ", jibunaddress=" + jibunaddress + ", latlng=" + latlng + ", detailaddress=" + detailaddress
				+ ", local=" + local + ", approvalstatus=" + approvalstatus + ", bank=" + bank + ", account=" + account
				+ ", people=" + people + ", bed=" + bed + ", price=" + price + ", houseRegDate=" + houseRegDate + "]";
	}

	
}
