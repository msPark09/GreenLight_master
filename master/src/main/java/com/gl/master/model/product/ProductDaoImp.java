package com.gl.master.model.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;

public class ProductDaoImp implements MasterDao {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProductVo> selectAll() {
		// TODO Auto-generated method stub
		List<ProductVo> list = sqlSession.selectList("product.selectAll");
		return list;
	}

	@Override
	public ProductVo selectOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.selectOne", id);
	}
	public List<ProDetailVo> selectDetail(String id){
		return sqlSession.selectList("product.selectDetail", id);		
	}

	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub
		//��ǰ �Է�
		sqlSession.insert("product.insertOne", (ProductVo)bean);
	}
	public void insertDetail(ProDetailVo bean){
		sqlSession.insert("product.insertDetail", bean);
		//��ǰ ������ �߰�
	}

	@Override
	public void updateOne(Object bean) {
		// TODO Auto-generated method stub
		//��ǰ ������Ʈ
		sqlSession.update("product.updateOne", (ProductVo)bean);
	}

	@Override
	public void deleteOne(String id) {
		// TODO Auto-generated method stub
		sqlSession.delete("product.deleteOne", id);//��ǰ ����
		sqlSession.delete("product.deleteAll", id);//��ǰ ������ ��� ����
	}
	public void delDetail(ProDetailVo bean){
		sqlSession.delete("product.deleteOneDetail", bean);//������ �����ؼ� ����
	}

	public List<CatVo> selectCat() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.selectCat");
	}
	public List<LocVo> selectLoc(String catname) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.selectLoc", catname);
	}

	public void updateDetail(String proid) {
		// TODO Auto-generated method stub
		sqlSession.update("product.updateDetail", proid);
	}

}
