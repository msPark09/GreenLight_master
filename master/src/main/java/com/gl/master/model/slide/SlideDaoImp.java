package com.gl.master.model.slide;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.product.ProductVo;

public class SlideDaoImp implements MasterDao {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<SlideVo> selectAll() {
		List<SlideVo> list = sqlSession.selectList("slide.selectAll");
		return list;
	}

	@Override
	public SlideVo selectOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("slide.selectOne", id);
	}

	@Override
	public void insertOne(Object bean) {
		sqlSession.insert("slide.insertOne", (SlideVo)bean);

	}

	@Override
	public void updateOne(Object bean) {
		sqlSession.update("slide.updateOne", (SlideVo)bean);

	}

	@Override
	public void deleteOne(String id) {
		sqlSession.delete("slide.deleteOne", id);

	}

	
	
}
