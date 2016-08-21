package com.lyj.controller.conventer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class CustomDateConverter implements Converter<String,Date>{

	public Date convert(String source) {
		//将日期串转换成日期类型格式为（yyyy-MM-dd HH:mm:ss）
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			//成功直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
//		//如果参数绑定失败，就返回当前时间
//		
//		source = simpleDateFormat.format(new Date());
//		try {
//			return simpleDateFormat.parse(source);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return null;
	}

	
	
	

}
