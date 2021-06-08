package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

// 공통 코드
public class HashMapBinder {
	
	Logger logger = Logger.getLogger(HashMapBinder.class);
	
	HttpServletRequest request = null;
	
	public HashMapBinder() {}

	// 생성자 객체 주입법
	// spring꺼보다는 후지다.
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
	}
	
	// DB와 만나므로 컬럼이 필요 - Map으로 구조체 만들자
	public void bind(Map<String, Object> target) {
		Enumeration<String> en = request.getParameterNames();
		// <input type="text" name="mem_id"... << name의 값이 "key"이다.
		// id와 pw가 모두 일치해야 하므로 교집합이다.
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			
			logger.info("value:"+request.getParameter(key));
			
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
			
			logger.info("value:"+target);
		}//////////end of while
	}//////////////end of bind
	
}
