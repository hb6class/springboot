package com.hb.sts4x.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hb.sts4x.model.entity.GuestVo;

@Repository
public class GuestDaoImpl implements GuestDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<GuestVo> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.hb.sts4x.model.GuestDao.selectAll");
	}

}
