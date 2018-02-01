package com.hb.sts4x;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
