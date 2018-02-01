package com.hb.sts4x;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	@RequestMapping("/test")
	public @ResponseBody String ex01() {
		return "hello world";
	}
	@RequestMapping("/test2")
	public @ResponseBody Map<String, String> ex02() {
		Map<String, String> map =new HashMap<>();
		map.put("item1", "value1");
		map.put("item2", "value2");
		map.put("item3", "value3");
		map.put("item4", "value4");
		return map;
	}
	
	@RequestMapping("/test3")
	public @ResponseBody List<String> ex03(){
		List<String> list = new ArrayList<>();
		list.add("item1");
		list.add("item2");
		list.add("item3");
		list.add("item4");
		return list;
	}
	
}














