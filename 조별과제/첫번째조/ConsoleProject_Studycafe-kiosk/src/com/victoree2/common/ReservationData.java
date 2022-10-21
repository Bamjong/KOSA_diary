package com.victoree2.common;

import java.io.Serializable;

public class ReservationData implements Serializable{//입실퇴실, 남은시간 기록
	private String id; //id
	private String name; //이름
	private String startDay; //결제일
	private String indate;//입실시간
	private String outdate;//퇴실시간
	private String endDay; //종료일
	private String remainderPeriod; //남은기간
	private boolean payStatus; //1: 정기구독권 2: 시간제사용자
	// 정기구독권의 경우 고정 자리 정보값을 받는다.
	private int roomarr; //열람실
	private String seat; //좌석
	//
	private int indexX;
	public int getIndexX() {
		return indexX;
	}



	public void setIndexX(int indexX) {
		this.indexX = indexX;
	}



	public int getIndexY() {
		return indexY;
	}



	public void setIndexY(int indexY) {
		this.indexY = indexY;
	}
	private int indexY;
	
	
	private static final long serialVersionUID = (long)5746694569156904200.0;


	
	private int price; //가격
	
	
	public String getIndate() {
		return indate;
	}



	public void setIndate(String indate) {
		this.indate = indate;
	}



	public String getOutdate() {
		return outdate;
	}



	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	
	public String getId() {
		return id;
	}
	
	
	
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	public int getRoomarr() {
		return roomarr;
	}
	public void setRoomarr(int roomarr) {
		this.roomarr = roomarr;
	}
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getRemainderPeriod() {
		return remainderPeriod;
	}
	public void setRemainderPeriod(String remainderPeriod) {
		this.remainderPeriod = remainderPeriod;
	}

	@Override
	public String toString() {
		return "[ID:" + id + " 이름:" + name + " 결제일:" + startDay + " 종료일:" + endDay + " 결제금액:" + price + "]"; 
//		return "ReservationData [id=" + id + ", name=" + name + ", startDay=" + startDay + ", indate=" + indate
//				+ ", outdate=" + outdate + ", endDay=" + endDay + ", remainderPeriod=" + remainderPeriod
//				+ ", payStatus=" + payStatus + ", roomarr=" + roomarr + ", seat=" + seat + ", price=" + price + "]";
	}
	
	public String entoString() {
		return "[ID:" + id + " name:" + name + " Payment date:" + startDay + " End date:" + endDay + " Payment amount:" + price + "]"; 
//		return "ReservationData [id=" + id + ", name=" + name + ", startDay=" + startDay + ", indate=" + indate
//				+ ", outdate=" + outdate + ", endDay=" + endDay + ", remainderPeriod=" + remainderPeriod
//				+ ", payStatus=" + payStatus + ", roomarr=" + roomarr + ", seat=" + seat + ", price=" + price + "]";
	}

	public boolean isPayStatus() {
		return payStatus;
	}
	public void setPayStatus(boolean payStatus) {
		this.payStatus = payStatus;
	}
}
