package com.java.host.dto;

public class SearchDateListCount {
	private int count;
	private int payment;
	
	public SearchDateListCount() {
		
	}

	public SearchDateListCount(int count, int payment) {
		this.count = count;
		this.payment = payment;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "SearchDateListCount [count=" + count + ", payment=" + payment + "]";
	}
	
	
}
