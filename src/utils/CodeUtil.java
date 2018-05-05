package utils;

import org.apache.commons.lang.xwork.RandomStringUtils;

import java.util.Calendar;

public class CodeUtil {
	public String AutoCode() {
		String rel="CART";
		
		Calendar c=Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int day=c.get(Calendar.DAY_OF_MONTH);
		int minute=c.get(Calendar.MINUTE);
		int second=c.get(Calendar.SECOND);
		String d=String.valueOf(year)+
				String.valueOf(month)+
				String.valueOf(day)+
				String.valueOf(minute)+
				String.valueOf(second);
		
		rel=rel+ RandomStringUtils.randomAlphabetic(10)+d;
		return rel;
	}
	
	public String AutoOrdersCode() {
		String rel="ORD";
		
		Calendar c=Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int day=c.get(Calendar.DAY_OF_MONTH);
		int minute=c.get(Calendar.MINUTE);
		int second=c.get(Calendar.SECOND);
		String d=String.valueOf(year)+
				String.valueOf(month)+
				String.valueOf(day)+
				String.valueOf(minute)+
				String.valueOf(second);
		
		rel=rel+ RandomStringUtils.randomAlphabetic(10)+d;
		return rel;
	}
}
