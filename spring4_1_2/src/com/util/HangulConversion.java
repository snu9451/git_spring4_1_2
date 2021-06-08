package com.util;

public class HangulConversion {
	public static String toUTF(String en) {
		if(en==null) return null;
		// 인코딩에 대한 내용이라서 반드시 예외처리가 필요함
		try {
			return new String(en.getBytes("8859_1"), "utf-8");
		} catch (Exception e) {
			return en;
		}
	}
}
