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
	
	String namespace="com.hb.sts4x.model.GuestDao.";

	@Override
	public List<GuestVo> selectAll() throws Exception {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public void insertOne(GuestVo bean) throws Exception {
		sqlSession.insert(namespace+"insertOne", bean);
	}

	@Override
	public GuestVo selectOne(int idx) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", idx);
	}

	@Override
	public int delOne(int idx) throws Exception {
		return sqlSession.delete(namespace+"delOne", idx);
	}

	@Override
	public int editOne(GuestVo bean) throws Exception {
		return sqlSession.update(namespace+"editOne",bean);
	}

}
