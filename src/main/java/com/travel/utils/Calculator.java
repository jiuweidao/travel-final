package com.travel.utils;


import java.text.DecimalFormat;




public class Calculator {


	/**
	 * int 相除保留两位小数
	 * @param dividend 被除数
	 * @param divisor	除数
	 * @return
	 */
	public static double divisionTo4(int dividend,int divisor) {
		if (divisor==0) {
			return 0;
		}
		float num= (float)dividend/divisor;   
		DecimalFormat df = new DecimalFormat("0.00");//格式化小数   
		String s = df.format(num);//返回的是String类型 
	    return  Double.parseDouble(s); 
	
	}

}
