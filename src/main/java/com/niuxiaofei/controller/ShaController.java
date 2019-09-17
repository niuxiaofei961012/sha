package com.niuxiaofei.controller;

import java.security.MessageDigest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ShaController {
	@RequestMapping("checkSha")
	@ResponseBody
	public String checkSha(String phone,String codeNo,String sha1) {
		String moCar = phone + codeNo;
		String digest = sha1(moCar);
		if(digest!=null && digest.equals(sha1)) {
			return "true";
		}else {
			return "false";
		}
	}
	
	public static String sha1(String text) {
		MessageDigest md = null;
		String outStr = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
			byte [] digest = md.digest(text.getBytes());
			outStr = byteToString(digest);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return outStr;
	}

	private static String byteToString(byte[] digest) {
		StringBuilder buf = new StringBuilder();
		for (int i = 0; i < digest.length; i++) {
			String temStr = Integer.toHexString(digest[i] & 0xff);
			if(temStr.length()==1) {
				buf.append("0").append(temStr);
			}else {
				buf.append(temStr);
			}
		}
		return buf.toString();
	}
	
	
}
