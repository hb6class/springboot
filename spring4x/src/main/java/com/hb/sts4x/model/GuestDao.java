package com.hb.sts4x.model;

import java.util.List;

import com.hb.sts4x.model.entity.GuestVo;

public interface GuestDao {

	List<GuestVo> selectAll() throws Exception;
	GuestVo selectOne(int idx) throws Exception;
	void insertOne(GuestVo bean) throws Exception;
}
