package com.hb.sts4x;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hb.sts4x.model.GuestDao;
import com.hb.sts4x.model.entity.GuestVo;

@RestController
public class NextController {

	@Autowired
	GuestDao guestDao;
	
	@RequestMapping("/list")
	public List<GuestVo> listAll() throws Exception {
		return guestDao.selectAll();
	}
	@RequestMapping("/{1}")
	public GuestVo listOne(@PathVariable("1") int idx) throws Exception {
		return guestDao.selectOne(idx);
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public void addOne(GuestVo bean) throws Exception {
		System.out.println(bean);
		guestDao.insertOne(bean);
	}
}
