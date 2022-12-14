package com.test.demo.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Time {
	
	Calendar time = Calendar.getInstance();

	public String Day() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "dd");
		String day = format1.format(time.getTime());
		return day;
	}
	
	public String Month() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "MM");
		String month = format1.format(time.getTime());
		return month;
	}
	
	public String Year() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");
		String year = format1.format(time.getTime());
		return year;
	}
	
}

