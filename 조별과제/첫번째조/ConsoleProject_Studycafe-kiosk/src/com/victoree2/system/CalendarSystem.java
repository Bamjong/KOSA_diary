package com.victoree2.system;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.victoree2.common.ReturnMessage;

public class CalendarSystem  extends ReturnMessage {
/*	public static String DateString(Calendar date) {
		return date.get(Calendar.YEAR)+"년"+
				(date.get(Calendar.MONTH)+1)+"월"+
						date.get(Calendar.DATE)+"일";
}*/
	
//	String dateString = format.format(currentDate);
//	Calendar cal = Calendar.getInstance();
	
	
	//다른곳에서 사용시 
//	
//	CalendarSystem cal = new CalendarSystem();
	
//	void datatata() {
//		cal.get()
//	}
//	cal.DateStirngYear(Calendar.getInstance());
//  	
	private String time;

	private Calendar now = Calendar.getInstance();
	private Calendar after = Calendar.getInstance();
	private String Month;
	public String DateStirngYear(Calendar date) {
		return date.get(Calendar.YEAR)+"년";
	}
	public String NowTime() { //현재시간 출력
		return DateString(now);
	}
	public String EndDay(Calendar date)
	{
		return DateString(date);
	}
	public String NowDate() {
		return DateFormat(now);
	}
	public String AfterTime(int aftertime) {
		after.add(Calendar.HOUR, aftertime);
		return DateFormat(after);
	}
	public String AfterDate() {
		return DateFormat(now);
	}
	public String DateStirngMonth(Calendar date) {

		return date.get(Calendar.MONTH)+"월";		
	}
	public String DateStirngDate(Calendar date) {
		
		return date.get(Calendar.DATE)+"일";		
	}
	public String DateStirngHour(Calendar date) {
		return date.get(Calendar.HOUR)+"시";		
	}
	public String DateStirngMinute(Calendar date) {
		return date.get(Calendar.MINUTE)+"분";		
	}

	public String DateString(Calendar date) {
		return date.get(Calendar.YEAR)+"년"+
					(date.get(Calendar.MONTH)+1)+"월"+
							date.get(Calendar.DATE)+"일"+
					date.get(Calendar.HOUR)+"시"+
							date.get(Calendar.MINUTE)+"분";
	
	}

	public String DateFormat(Calendar date) {
		if((date.get(Calendar.MONTH)+1<10))
		{
			Month = "0"+(date.get(Calendar.MONTH)+1);
		}
		else
		{
			Month = ""+(date.get(Calendar.MONTH)+1);
		}
		return date.get(Calendar.YEAR)+""+
				(Month)+""+
						date.get(Calendar.DATE)+""+
				date.get(Calendar.HOUR)+""+
						date.get(Calendar.MINUTE)+"";
	}
	public Long RemainderPeriod(String date1, String date2) {
		String refundTime="";
		DateFormat format = new SimpleDateFormat("yyyyMMddHH");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(date1);
			 d2 = format.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 long Hour = (d1.getTime() - d2.getTime()); // 시간 *시간 기준 환불 금액 500원
//		 System.out.println(Hour);
		 return Hour;
	}
	
	public Long refundMoneyTime(String date1, String date2){
		String refundTime="";
		DateFormat format = new SimpleDateFormat("yyyyMMddHH");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(date1);
			 d2 = format.parse(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 long Hour = (d1.getTime() - d2.getTime()) / 3600000*500; // 시간 *시간 기준 환불 금액 500원
		 return Hour;
	}

	public Long refundMoneySeason(String date1, String date2){
		String refundSeason="";
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse( date1 );
			d2 = format.parse( date2 );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	

		 long Days = (d1.getTime() - d2.getTime())/ (3600000 *24) *4000;// 일자수*일 기준 환불 기준 금액 4000 
		 refundSeason =Long.toString(Days);
		return Days;
	}
		

	public void setTime(String time) {
		this.time = time;
	}
	
}

