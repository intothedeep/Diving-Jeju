package com.free.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Encoding {
	public static String isoToUtf(String tmp) {
		String utf = "";
		try {
			if(tmp != null)
				utf = new String(tmp.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return utf;
	}
	
	public static String urlUtf(String tmp) {
		String utf = "";
		tmp = tmp.trim();
		try {
			utf = URLEncoder.encode(tmp, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utf;
	}
	
}
